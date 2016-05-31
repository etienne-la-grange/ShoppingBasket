//
//  BasketListViewController.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//
// 

#import "BasketListViewController.h"
#import "BasketListTableViewCell.h"
#import "BasketListService.h"
#import "BasketItem.h"

static NSString *tableViewCellIdentifier = @"BasketItemReuseIdentifier";
static NSString *tableViewHeaderIdentifier = @"BasketItemHeaderReuseIdentifier";


@interface BasketListViewController (Test)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface BasketListViewController ()

@end

@implementation BasketListViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [BasketListService sharedInstance].basketListArray.count;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewHeaderIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewHeaderIdentifier];
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BasketListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[BasketListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdentifier];
        
    }
    cell.delegate = self;
    cell.basketListIndex = indexPath.row;
    BasketItem *basketItem = [[BasketListService sharedInstance].basketListArray objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@:",basketItem.itemName];
    
    NSNumberFormatter *priceFormatter = [[NSNumberFormatter alloc] init];
    [priceFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en-us"]];
    [priceFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    cell.priceLabel.text = [NSString stringWithFormat:@"%@ %@",[priceFormatter stringFromNumber:basketItem.itemPrice],basketItem.itemDescription];
    cell.quantityLabel.text = [NSString stringWithFormat:@"%ld",basketItem.itemQuantity];
    
    return cell;
}

// Disable the user selecting the cell to highlight it
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}



#pragma mark - UI Logic for the shopping List
-(void) plusPressed:(NSInteger)index {
    BasketItem *basketItem = [[BasketListService sharedInstance].basketListArray objectAtIndex:index];
    if (basketItem.itemQuantity == 99) {
        // We want to limit the incrementing of the quantity to 99.
        // By not doing anything if the quantity is 99 we don't make use of first incrementing the cell and then clipping it to 99 and redrawing the cell
        return;
    }
    
    basketItem.itemQuantity++;
    basketItem.itemTotal = [basketItem.itemPrice decimalNumberByMultiplyingBy:[[NSDecimalNumber alloc] initWithInteger:basketItem.itemQuantity]];
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

-(void) minusPressed:(NSInteger)index {
    BasketItem *basketItem = [[BasketListService sharedInstance].basketListArray objectAtIndex:index];
    if (basketItem.itemQuantity == 0) {
        // We want to limit the decrementing of the quantity to zero.
        // By not doing anything if the quantity is zero, we get the same behaviour as for the plusPressed limiting
        return;
    }
    
    basketItem.itemQuantity--;
    basketItem.itemTotal = [basketItem.itemPrice decimalNumberByMultiplyingBy:[[NSDecimalNumber alloc] initWithInteger:basketItem.itemQuantity]];
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

@end

