//
//  BasketListTableViewCell.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import "BasketListTableViewCell.h"

@implementation BasketListTableViewCell

@synthesize nameLabel = _nameLabel;
@synthesize priceLabel = _priceLabel;
@synthesize quantityLabel = _quantityLabel;
@synthesize basketListIndex = _basketListIndex;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction) plusButtonPressed:(id) sender {
    [self.delegate plusPressed:_basketListIndex];
}

-(IBAction) minusButtonPressed:(id) sender {
    [self.delegate minusPressed:_basketListIndex];
}
@end
