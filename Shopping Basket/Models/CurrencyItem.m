//
//  CurrencyItem.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//
// Data Object for Currency Exchange Items
#import "CurrencyItem.h"

@implementation CurrencyItem

@synthesize currencyCode = _currencyCode;
@synthesize currencyName = _currencyName;
@synthesize currencyExchangeRate = _currencyExchangeRate;

-(id) initCurrencyItemWithCode:(NSString *)code name:(NSString *)name currencyExchangeRate:(NSDecimalNumber *) currencyExchangeRate {
    self.currencyCode = code;
    self.currencyName = name;
    self.currencyExchangeRate = currencyExchangeRate;
    return self;
}

@end
