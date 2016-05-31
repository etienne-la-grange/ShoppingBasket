//
//  NSString_CalculationTests.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/31/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Calculation.h"

@interface NSString_CalculationTests : XCTestCase

@end

@implementation NSString_CalculationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCurrencyConversionString {
    NSDecimalNumber *testValue = [NSDecimalNumber decimalNumberWithString:@"1.00"];
    NSDecimalNumber *testExchangeRate = [NSDecimalNumber decimalNumberWithString:@"0.98765"];

    NSString *convertedString = [NSString calculateExchangedValue:testValue usingExchangeRate:testExchangeRate usingCurrencyCode:@"GBP"];
    
    NSString *expectedResult = @"£0.99";
    XCTAssertEqualObjects(expectedResult, convertedString, @"The calculation echange rate conversion failed");
}


@end
