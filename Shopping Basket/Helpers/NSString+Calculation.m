//
//  NSString+Calculation.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/30/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//
// Helper class to calculate and format the currency amounts

#import "NSString+Calculation.h"

@implementation NSString (Calculation)



+(NSString *)calculateExchangedValue:(NSDecimalNumber *)value usingExchangeRate:(NSDecimalNumber *)exchangeRate usingCurrencyCode:(NSString *)currencyCode {
    
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [currencyFormatter setCurrencyCode:currencyCode];
    
    NSDecimalNumber *exchangeRateValue = [value decimalNumberByMultiplyingBy:exchangeRate];
    NSString *responseString = [currencyFormatter stringFromNumber:exchangeRateValue];
    
    return responseString;
}

@end
