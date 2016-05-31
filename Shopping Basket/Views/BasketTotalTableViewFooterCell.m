//
//  BasketTotalTableViewFooterCell.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/30/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import "BasketTotalTableViewFooterCell.h"

@implementation BasketTotalTableViewFooterCell


@synthesize descriptionLabel = _descriptionLabel;
@synthesize amountLabel = _amountLabel;
@synthesize descriptionUSDLabel = _descriptionUSDLabel;
@synthesize amountUSDLabel = _amountUSDLabel;
@synthesize exchangeRateLabel = _exchangeRateLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
