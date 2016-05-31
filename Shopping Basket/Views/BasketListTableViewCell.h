//
//  BasketListTableViewCell.h
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <UIKit/UIKit.h>


// Protocol definition starts here
@protocol BasketListTableViewCellButtonsProtocol <NSObject>

@required

- (void) plusPressed:(NSInteger) index;
- (void) minusPressed:(NSInteger) index;

@end
// Protocol Definition ends here


@interface BasketListTableViewCell : UITableViewCell

{
    // Delegate to respond back
    id <BasketListTableViewCellButtonsProtocol> _delegate;
}


@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;
@property (nonatomic, weak) IBOutlet UILabel *quantityLabel;
@property (nonatomic, weak) IBOutlet UIButton *minusButton;
@property (nonatomic, weak) IBOutlet UIButton *plusButton;
@property (nonatomic, strong) id delegate;
@property (nonatomic, assign) NSInteger basketListIndex;

/*
-(IBAction) plusButtonPressed:(id) sender;

-(IBAction) minusButtonPressed:(id) sender;
*/
 @end
