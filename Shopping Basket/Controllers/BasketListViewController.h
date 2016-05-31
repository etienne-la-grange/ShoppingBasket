//
//  BasketListViewController.h
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasketListTableViewCell.h"

@interface BasketListViewController : UIViewController <BasketListTableViewCellButtonsProtocol,UITableViewDelegate, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end
