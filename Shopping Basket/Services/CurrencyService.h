//
//  CurrencyService.h
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyService : NSObject

+ (CurrencyService *)sharedInstance;

@property (nonatomic,strong) NSArray *currencyListArray;
@property (nonatomic, strong) NSDate *lastUpdateDate;
@property (nonatomic, assign) NSInteger lastSelectedCurrency;
@property (nonatomic, assign) BOOL lastDownloadFailed;

-(void) checkAndUpdateExchangeRates;

@end
