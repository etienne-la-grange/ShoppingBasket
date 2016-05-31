//
//  BasketListService.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//
// This class is used to manage the shopping list used in the Application.
// In this class we populate the basket list with objects. In a typical
// Application this items that is used for purchasing could be managed from
// a Web API.

#import "BasketListService.h"
#import "BasketItem.h"

@implementation BasketListService

static BasketListService *basketListService = nil;

@synthesize basketListArray = _basketListArray;

+ (BasketListService*)sharedInstance {
    
    if (basketListService == nil)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            basketListService = [[BasketListService alloc] init];
            
            //Create and populate the array with initial objects.
            basketListService.basketListArray = [NSMutableArray array];
            [basketListService populateBasketListArray];
        });
    }
    
    return basketListService;
}

// Populate the list with initial values as was specified in the Test. Could also be populated from a Plist, Core Data, or Web API feed
-(void) populateBasketListArray {

    BasketItem *basketItem1 = [[BasketItem alloc] initBasketItemWithName:@"Peas"
                                                                   price:[NSDecimalNumber decimalNumberWithString:@"0.95"]
                                                             description:@"per bag"
                                                                quantity:0];
    
    BasketItem *basketItem2 = [[BasketItem alloc] initBasketItemWithName:@"Eggs"
                                                                   price:[NSDecimalNumber decimalNumberWithString:@"2.10"]
                                                             description:@"per dozen"
                                                                quantity:0];
    
    BasketItem *basketItem3 = [[BasketItem alloc] initBasketItemWithName:@"Milk"
                                                                   price:[NSDecimalNumber decimalNumberWithString:@"1.30"]
                                                             description:@"per bottle"
                                                                quantity:0];
    
    BasketItem *basketItem4 = [[BasketItem alloc] initBasketItemWithName:@"Beans"
                                                                   price:[NSDecimalNumber decimalNumberWithString:@"0.73"]
                                                             description:@"per can"
                                                                quantity:0];
    
    [self.basketListArray addObjectsFromArray:@[basketItem1,basketItem2,basketItem3,basketItem4]];

}


@end
