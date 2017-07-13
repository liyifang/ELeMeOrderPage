//
//  ShoppingMalAlllModel.m
//  Persion
//
//  Created by liyifang on 2017/4/19.
//  Copyright © 2017年 段凯. All rights reserved.
//

#import "ShoppingMalAllModel.h"

@implementation ShoppingMalAllModel
-(NSMutableArray *)orderingModelsArr
{
    if (!_orderingModelsArr) {
        _orderingModelsArr = [NSMutableArray array];
    }
    return _orderingModelsArr;
}

-(NSMutableArray *)healthCareModelsArr
{
    if (!_healthCareModelsArr) {
        _healthCareModelsArr = [NSMutableArray array];
    }
    return _healthCareModelsArr;
}

-(NSMutableArray *)shoppingModelsArr
{
    if (!_shoppingModelsArr) {
        _shoppingModelsArr = [NSMutableArray array];
    }
    return _shoppingModelsArr;
}

-(NSMutableArray *)houseKeepingModelsArr
{
    if (!_houseKeepingModelsArr) {
        _houseKeepingModelsArr = [NSMutableArray array];
    }
    return _houseKeepingModelsArr;
}
@end
//医护------------------------------------------------------
@implementation HealthCareModel
//-(void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    
//}
@end
//订餐------------------------------------------------------
@implementation OrderingModel//订餐
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
//购物------------------------------------------------------
@implementation ShoppingModel //购物
//-(void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    
//}
@end
//家政------------------------------------------------------
@implementation HouseKeepingModel//家政
//-(void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    
//}
@end

