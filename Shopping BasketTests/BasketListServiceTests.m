//
//  BasketListServiceTests.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/31/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BasketListService.h"

@interface BasketListServiceTests : XCTestCase

@end

@implementation BasketListServiceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasketListPopulation {

    NSArray *basketListArray = [BasketListService sharedInstance].basketListArray;

    XCTAssertEqual(basketListArray.count, 4, @"Not all the objects were created in the BasketListService");
    
}


@end
