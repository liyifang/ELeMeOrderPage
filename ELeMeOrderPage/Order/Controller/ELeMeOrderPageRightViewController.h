//
//  ELeMeOrderPageRghtViewController.h
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "OrderFoodModel.h"
@interface ELeMeOrderPageRightViewController : UIViewController
@property (nonatomic, strong, readonly) LWGesturePenetrationTableView *tableView;
@property (nonatomic, assign) OffsetType offsetType;
@property (nonatomic, strong)OrderFoodModel *orderFoodModel;
@end
