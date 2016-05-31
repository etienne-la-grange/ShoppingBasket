//
//  BasketListService.h
//  Shopping Basket
//
//  Created by Etienne La Grange on 5/29/16.
//  Copyright © 2016 Etienne la Grange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasketListService : NSObject


+ (BasketListService *)sharedInstance;

@property (nonatomic,strong) NSMutableArray *basketListArray;

@end
