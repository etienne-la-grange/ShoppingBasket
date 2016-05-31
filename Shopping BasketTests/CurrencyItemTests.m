//
//  CurrencyItemTests.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/31/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CurrencyItem.h"

@interface CurrencyItemTests : XCTestCase

@end

@implementation CurrencyItemTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCurrencyItemCreation {
    NSDecimalNumber *testExchangeRate = [NSDecimalNumber decimalNumberWithString:@"0.99"];
    
    CurrencyItem *currencyItem = [[CurrencyItem alloc] initCurrencyItemWithCode:@"GBP" name:@"British Pound" currencyExchangeRate:testExchangeRate];
    XCTAssertEqualObjects(currencyItem.currencyName, @"British Pound", @"Name of CurrencyItem not initialised correctly");
    XCTAssertEqualObjects([currencyItem.currencyExchangeRate stringValue], @"0.99", @"Exchange rate of CurrencyItem not initialised correctly");
    XCTAssertEqualObjects(currencyItem.currencyCode, @"GBP", @"CurrencyCode of CurrencyItem not initialised correctly");
}


@end
