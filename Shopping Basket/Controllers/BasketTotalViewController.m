//
//  BasketTotalViewController.m
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import "BasketTotalViewController.h"
#import "BasketTotalTableViewCell.h"
#import "BasketTotalTableViewFooterCell.h"
#import "BasketListService.h"
#import "BasketItem.h"
#import "NSString+Calculation.h"
#import "CurrencyService.h"
#import "CurrencyItem.h"

static NSString *tableViewCellIdentifier = @"BasketTotalReuseIdentifier";
static NSString *tableViewHeaderIdentifier = @"BasketTotalHeaderReuseIdentifier";
static NSString *tableViewFooterIdentifier = @"BasketTotalFooterReuseIdentifier";

@interface BasketTotalViewController ()

@property (nonatomic,strong) NSNumberFormatter *priceUSDFormatter;

@end

@implementation BasketTotalViewController

@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.priceUSDFormatter = [[NSNumberFormatter alloc] init];
    [self.priceUSDFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en-us"]];
    [self.priceUSDFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
}


-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //we refresh the view in case the user has come from the currencyselector view, or in case the user has fixed network, so it refreshes
    //we could also rather add NSNotification when the currencies have downloaded/refreshed to reload the view, but did not enough time to implement this.
    [self performSelector:@selector(refreshTheView)];
    [self performSelector:@selector(refreshTheView) withObject:NULL afterDelay:10];
}


-(void) refreshTheView {
    [self.tableView reloadData];
}


-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
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


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

#pragma mark - Tableview Header Section

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewHeaderIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewHeaderIdentifier];
        
    }
    
    return cell;
}


#pragma mark - Tableview Footer Section

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 83;
}


- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    BasketTotalTableViewFooterCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewFooterIdentifier];
    
    if (cell == nil) {
        cell = [[BasketTotalTableViewFooterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewFooterIdentifier];
        
    }
    
    NSDecimalNumber *totalAmountInDollar = [[NSDecimalNumber alloc] initWithFloat:0];
    NSDecimalNumber *exchangeRate = [[NSDecimalNumber alloc] initWithFloat:0];;
    
    for (BasketItem *basketItem in [BasketListService sharedInstance].basketListArray) {
        totalAmountInDollar = [totalAmountInDollar decimalNumberByAdding:basketItem.itemTotal];
    }
    
    NSArray *currencyArray = [CurrencyService sharedInstance].currencyListArray;
    CurrencyItem *selectedCurrencyItem = NULL;
    if (currencyArray.count > 0) {
    
        selectedCurrencyItem = [currencyArray objectAtIndex:[CurrencyService sharedInstance].lastSelectedCurrency];
        exchangeRate = selectedCurrencyItem.currencyExchangeRate;
    }
    
    
    cell.descriptionUSDLabel.text = @"Basket Total in USD:";
    cell.amountUSDLabel.text = [self.priceUSDFormatter stringFromNumber:totalAmountInDollar];
                             
    cell.descriptionLabel.text = [NSString stringWithFormat:@"Basket Total in %@:",selectedCurrencyItem.currencyCode];
    cell.amountLabel.text = [NSString calculateExchangedValue:totalAmountInDollar usingExchangeRate:exchangeRate usingCurrencyCode:selectedCurrencyItem.currencyCode];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateOfExchangeRate = [formatter stringFromDate:[CurrencyService sharedInstance].lastUpdateDate];
    
    cell.exchangeRateLabel.text = [NSString stringWithFormat:@" %@ : 1 USD = %.5f %@", dateOfExchangeRate, [exchangeRate floatValue], selectedCurrencyItem.currencyCode];
    
   
    cell.amountLabel.hidden = currencyArray.count == 0;
    
    if ([CurrencyService sharedInstance].lastDownloadFailed) {
    
        cell.descriptionLabel.text = @"Check network";
        cell.exchangeRateLabel.text = @"Could not download the exchange rates.";
        self.chooseCurrencyButton.enabled = FALSE;
        
    } else {
        self.chooseCurrencyButton.enabled = TRUE;
    }
    
    
    return cell;
}

#pragma mark - Table View Main Cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BasketTotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[BasketTotalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableViewCellIdentifier];
        
    }
    BasketItem *basketItem = [[BasketListService sharedInstance].basketListArray objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@:",basketItem.itemName];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@ %@",[self.priceUSDFormatter stringFromNumber:basketItem.itemPrice], basketItem.itemDescription];
    cell.quantityLabel.text = [NSString stringWithFormat:@"%ld",basketItem.itemQuantity];
    cell.totalLabel.text = [self.priceUSDFormatter stringFromNumber:basketItem.itemTotal];
    return cell;
}

#pragma mark - Tableview logic section
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


@end
