//
//  BasketTotalTableViewCell.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import "BasketTotalTableViewCell.h"

@implementation BasketTotalTableViewCell

@synthesize nameLabel = _nameLabel;
@synthesize priceLabel = _priceLabel;
@synthesize quantityLabel = _quantityLabel;
@synthesize totalLabel = _totalLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
