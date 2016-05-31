//
//  CurrencyService.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//
// We use the following URL to get a list of currencies and their exchange rates http://www.apilayer.net/api/live?access_key=59c63434deb0a7d82931ccfa79d06fb0&format=1
// We can also get a list of the currency titles from http://apilayer.net/api/list?access_key=59c63434deb0a7d82931ccfa79d06fb0&format=1

#import "CurrencyService.h"
#import "CurrencyItem.h"


@implementation CurrencyService

static CurrencyService *currencyService = nil;
static NSString *apiKey = @"59c63434deb0a7d82931ccfa79d06fb0";

@synthesize currencyListArray = _currencyListArray;
@synthesize lastUpdateDate = _lastUpdateDate;
@synthesize lastSelectedCurrency = _lastSelectedCurrency;
@synthesize lastDownloadFailed = _lastDownloadFailed;

+ (CurrencyService*)sharedInstance {
    
    if (currencyService == nil)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            currencyService = [[CurrencyService alloc] init];
            
            //Create and populate the array with initial objects.
            currencyService.currencyListArray = [NSArray array];
            currencyService.lastDownloadFailed = FALSE;
            
        });
    }
    
    return currencyService;
}

// Populate the list with initial values as was specified in the Test. Could also be populated from a Plist, Core Data, or Web API feed
-(void) populateCurrencyListArray {
    
    //we download the list of currencies first, and then the exchange rates to populate them
    self.currencyListArray = [NSArray array];
    NSURL *downloadURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://apilayer.net/api/list?access_key=%@&format=1",apiKey]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:downloadURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error != nil) {
            self.lastDownloadFailed = TRUE;
            return;
        }
        self.lastDownloadFailed = FALSE;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *currencyDict = [json objectForKey:@"currencies"];
        
        NSMutableArray *currencyTempArray = [NSMutableArray array];
        for (NSString *currencyKey in [currencyDict allKeys]) {
            CurrencyItem *currencyItem = [[CurrencyItem alloc] initCurrencyItemWithCode:currencyKey name:[currencyDict objectForKey:currencyKey] currencyExchangeRate:0];
            [currencyTempArray addObject:currencyItem];
        }
        
        //sort the currency Codes as they are unsorted from the List API
        self.currencyListArray = [currencyTempArray sortedArrayUsingComparator:^NSComparisonResult(id firstItem, id secondItem) {
            NSString *firstCode = [(CurrencyItem*)firstItem currencyCode];
            NSString *secondCode = [(CurrencyItem*)secondItem currencyCode];
            return [firstCode compare:secondCode];
        }];
        
        [self updateCurrencExchangeRates];
    }];
    
    [dataTask resume];
}

-(void) updateCurrencExchangeRates {
    NSURL *downloadURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://apilayer.net/api/live?access_key=%@&format=1",apiKey]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:downloadURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error != nil) {
            self.lastDownloadFailed = TRUE;
            return;
        }
        self.lastDownloadFailed = FALSE;
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSInteger timeInMiliseconds = [[jsonResponse objectForKey:@"timestamp"] integerValue];
        NSDate* exchangeRateDate = [NSDate dateWithTimeIntervalSince1970:timeInMiliseconds];
        self.lastUpdateDate = exchangeRateDate;
        
        NSDictionary *currencyDict = [jsonResponse objectForKey:@"quotes"];
        
        for (NSString *currencyKey in [currencyDict allKeys]) {
            
            NSString *currencyKeyCode = currencyKey;
            if (currencyKey.length == 6) {
                //the new api has the key as USDxxx, and we want to extract the xxx
                currencyKeyCode = [currencyKey substringFromIndex:3];
            }
            
            for (CurrencyItem *currencyItemInArray in self.currencyListArray) {
                if ([currencyItemInArray.currencyCode isEqualToString:currencyKeyCode]) {
                    currencyItemInArray.currencyExchangeRate = [[NSDecimalNumber alloc] initWithFloat:[[currencyDict objectForKey:currencyKey] floatValue]];
                }
            }
            
        }
    }];
    
    [dataTask resume];
    
}

-(void) checkAndUpdateExchangeRates {
    if (self.currencyListArray.count == 0) {
        
        [self populateCurrencyListArray];
        
    } else {
    
        [self updateCurrencExchangeRates];
    }
    
    //we refresh the Exchange rates every 10 seconds in the background
    [self performSelector:@selector(checkAndUpdateExchangeRates) withObject:nil afterDelay:10.0];
}

@end
