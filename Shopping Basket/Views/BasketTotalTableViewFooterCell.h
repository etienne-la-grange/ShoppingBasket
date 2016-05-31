//
//  BasketTotalTableViewFooterCell.h
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/30/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasketTotalTableViewFooterCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *descriptionUSDLabel;
@property (nonatomic, weak) IBOutlet UILabel *amountUSDLabel;

@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *amountLabel;

@property (nonatomic, weak) IBOutlet UILabel *exchangeRateLabel;

@end
