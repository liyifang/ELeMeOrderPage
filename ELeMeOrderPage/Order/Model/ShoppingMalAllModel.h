//
//  ShoppingMalAlllModel.h
//  Persion
//
//  Created by liyifang on 2017/4/19.
//  Copyright © 2017年 段凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingMalAllModel : NSObject
@property(nonatomic, strong)NSMutableArray *orderingModelsArr;
@property(nonatomic, strong)NSMutableArray *healthCareModelsArr;
@property(nonatomic, strong)NSMutableArray *shoppingModelsArr;
@property(nonatomic, strong)NSMutableArray *houseKeepingModelsArr ;
@property(nonatomic, assign)NSInteger healthCarePage;
@property(nonatomic, assign)NSInteger orderingPage;
@property(nonatomic, assign)NSInteger shoppingPage;
@property(nonatomic, assign)NSInteger houseKeepingPage;
@end

//医护------------------------------------------------------
@interface HealthCareModel : NSObject//医护
@property(nonatomic, strong)NSString *pic;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *sales;
@property(nonatomic, strong)NSString *price;
@property(nonatomic, strong)NSString *type;


@end
//订餐------------------------------------------------------
@interface OrderingModel : NSObject//订餐
@property(nonatomic, strong)NSString *shop_id;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *pic;
@property(nonatomic, strong)NSString *evaluate;
@property(nonatomic, strong)NSString *sales;
@property(nonatomic, strong)NSString *deliver_fee;
@property(nonatomic, strong)NSString *start_price;
@property(nonatomic, strong)NSString *distance;
@property(nonatomic, strong)NSString *time;
@property(nonatomic, strong)NSString *is_open;
@end
//购物------------------------------------------------------
@interface ShoppingModel :NSObject//购物
@property(nonatomic, strong)NSString *pic;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *sales;
@property(nonatomic, strong)NSString *price;
@property(nonatomic, strong)NSString *type;
@end
//家政------------------------------------------------------
@interface HouseKeepingModel : NSObject//家政
@property(nonatomic, strong)NSString *pic;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *sales;
@property(nonatomic, strong)NSString *price;
@property(nonatomic, strong)NSString *type;
@end
