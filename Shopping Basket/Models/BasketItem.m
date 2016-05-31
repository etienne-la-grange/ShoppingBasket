//
//  BasketItem.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//
// Data Object for BasketItems

#import "BasketItem.h"

@implementation BasketItem

@synthesize itemName = _itemName;
@synthesize itemDescription = _itemDescription;
@synthesize itemQuantity = _itemQuantity;
@synthesize itemPrice = _itemPrice;
@synthesize itemTotal = _itemTotal;

-(id) initBasketItemWithName:(NSString *)name price:(NSDecimalNumber *)price description:(NSString *)description quantity:(NSInteger)quantity {
    self.itemName = name;
    self.itemPrice = price;
    self.itemDescription = description;
    self.itemQuantity = quantity;
    self.itemTotal = [_itemPrice decimalNumberByMultiplyingBy:[[NSDecimalNumber alloc] initWithInteger:_itemQuantity]];
    return self;
}
@end
