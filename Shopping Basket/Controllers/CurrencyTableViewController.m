//
//  CurrencyTableViewController.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import "CurrencyTableViewController.h"
#import "CurrencyItem.h"
#import "CurrencyService.h"
#import "CurrencyTableViewCell.h"

static NSString *tableViewCellIdentifier = @"CurrencyReuseIdentifier";
static NSString *tableViewHeaderIdentifier = @"CurrencyHeaderReuseIdentifier";

@interface CurrencyTableViewController ()

@end

@implementation CurrencyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return MAX([CurrencyService sharedInstance].currencyListArray.count,1);
}

#pragma mark - Tableview Header Section

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

#pragma mark - Tableview Main Section

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CurrencyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[CurrencyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdentifier];
    }
    
    if (indexPath.row == [CurrencyService sharedInstance].lastSelectedCurrency) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    CurrencyItem *currencyItem = [[CurrencyService sharedInstance].currencyListArray objectAtIndex:indexPath.row];
    
    cell.currencyLabel.text = [NSString stringWithFormat:@"%@:",currencyItem.currencyCode];
    cell.exchangeLabel.text = [NSString stringWithFormat:@"%@",currencyItem.currencyName];
    
    return cell;
}


#pragma mark - Tableview logic section
// Disable the user selecting the cell to highlight it
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
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


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    //unselect the previous cell without reloading the whole table
    [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:[CurrencyService sharedInstance].lastSelectedCurrency inSection:0]].accessoryType = UITableViewCellAccessoryNone;

    //select the new cell
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    [tableView cellForRowAtIndexPath:indexPath].selected = FALSE;
    [CurrencyService sharedInstance].lastSelectedCurrency = indexPath.row;
}

@end
