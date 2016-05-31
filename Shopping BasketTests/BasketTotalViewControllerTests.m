//
//  BasketTotalViewControllerTests.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/31/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BasketTotalViewController.h"

@interface BasketTotalViewControllerTests : XCTestCase

@property (nonatomic, strong) BasketTotalViewController *basketTotalViewController;

@end

@implementation BasketTotalViewControllerTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.basketTotalViewController = [storyboard instantiateViewControllerWithIdentifier:@"BasketTotalViewControllerID"];
    [self.basketTotalViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    self.basketTotalViewController = nil;
    [super tearDown];
}

- (void)testViewControllerLoaded {
    XCTAssertNotNil(self.basketTotalViewController.view, @"View not initiated properly");
}

- (void)testTableViewHeaderHeight {
    XCTAssertEqual([self.basketTotalViewController tableView:self.basketTotalViewController.tableView heightForHeaderInSection:0], 40, @"HeaderView not initiated properly");
}

- (void)testTableViewFooterHeight {
    XCTAssertEqual([self.basketTotalViewController tableView:self.basketTotalViewController.tableView heightForFooterInSection:0], 83, @"FooterView not initiated properly");
}
@end
