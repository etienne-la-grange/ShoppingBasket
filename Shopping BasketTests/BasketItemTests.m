//
//  BasketItemTests.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/31/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BasketItem.h"

@interface BasketItemTests : XCTestCase

@end

@implementation BasketItemTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasketItemCreation {
    NSDecimalNumber *testPrice = [NSDecimalNumber decimalNumberWithString:@"0.99"];

    BasketItem *basketItem = [[BasketItem alloc] initBasketItemWithName:@"Eggs" price:testPrice description:@"per dozen" quantity:2];
    XCTAssertEqualObjects(basketItem.itemName, @"Eggs", @"Name of BasketItem not initialised correctly");
    XCTAssertEqualObjects([basketItem.itemPrice stringValue], @"0.99", @"Price of BasketItem not initialised correctly");
    XCTAssertEqualObjects(basketItem.itemDescription, @"per dozen", @"Description of BasketItem not initialised correctly");
    XCTAssertEqual(basketItem.itemQuantity, 2, @"Quantity of BasketItem not initialised correctly");
}


@end
