//
//  NSString+Calculation.h
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/30/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Calculation)


+(NSString *)calculateExchangedValue:(NSDecimalNumber *)value usingExchangeRate:(NSDecimalNumber *)exchangeRate usingCurrencyCode:(NSString *)currencyCode;

@end
