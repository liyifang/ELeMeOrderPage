//
//  ELeMeOrderPageLeftViewController.h
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "OrderFoodModel.h"
@interface ELeMeOrderPageLeftViewController : UIViewController
@property(nonatomic, strong,readonly)LWGesturePenetrationTableView *rightTableView;
@property (nonatomic, assign) OffsetType offsetType;
@property (nonatomic, strong)OrderFoodModel *orderFoodModel;
@end
