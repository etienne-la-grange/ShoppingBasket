//
//  BasketListViewControllerTests.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/31/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BasketListViewController.h"

@interface BasketListViewControllerTests : XCTestCase

@property (nonatomic, strong) BasketListViewController *basketListViewController;

@end

@implementation BasketListViewControllerTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.basketListViewController = [storyboard instantiateViewControllerWithIdentifier:@"BasketListControllerID"];
    [self.basketListViewController performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
}

- (void)tearDown {
    self.basketListViewController = nil;
    [super tearDown];
}

- (void)testViewControllerLoaded {
    XCTAssertNotNil(self.basketListViewController.view, @"View not initiated properly");
}

- (void)testTableViewHeaderHeight {
    XCTAssertEqual([self.basketListViewController tableView:self.basketListViewController.tableView heightForHeaderInSection:0], 40, @"HeaderView not initiated properly");
}


@end
