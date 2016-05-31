//
//  BasketItem.h
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasketItem : NSObject

@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSDecimalNumber *itemPrice;
@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, assign) NSInteger itemQuantity;
@property (nonatomic, strong) NSDecimalNumber *itemTotal;

-(id) initBasketItemWithName:(NSString *)name price:(NSDecimalNumber *)price description:(NSString *)description quantity:(NSInteger)quantity;
@end
