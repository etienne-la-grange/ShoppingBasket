//
//  CurrencyItem.h
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyItem : NSObject

@property (nonatomic, strong) NSString *currencyCode;
@property (nonatomic, strong) NSString *currencyName;
@property (nonatomic, strong) NSDecimalNumber *currencyExchangeRate;

-(id) initCurrencyItemWithCode:(NSString *)code name:(NSString *)name currencyExchangeRate:(NSDecimalNumber *) currencyExchangeRate;

@end
