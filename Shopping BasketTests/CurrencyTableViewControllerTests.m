//
//  CurrencyTableViewControllerTests.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/31/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CurrencyTableViewController.h"

@interface CurrencyTableViewControllerTests : XCTestCase

@property (nonatomic, strong) CurrencyTableViewController *currencyTableViewController;

@end

@implementation CurrencyTableViewControllerTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.currencyTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"CurrencyTableViewControllerID"];
    [self.currencyTableViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    self.currencyTableViewController = Nil;
    [super tearDown];
}

- (void)testViewControllerLoaded {
    XCTAssertNotNil(self.currencyTableViewController.view, @"View not initiated properly");
}

- (void)testTableViewHeaderHeight {
    XCTAssertEqual([self.currencyTableViewController tableView:self.currencyTableViewController.tableView heightForHeaderInSection:0], 40, @"HeaderView not initiated properly");
}


@end
