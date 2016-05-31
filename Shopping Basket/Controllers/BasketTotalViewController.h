//
//  BasketTotalViewController.h
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasketTotalViewController : UIViewController <UITableViewDelegate, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *totalLabel;
@property (nonatomic, weak) IBOutlet UIButton *chooseCurrencyButton;


@end
