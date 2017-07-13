//
//  OrderFoodModel.m
//  Persion
//
//  Created by liyifang on 2017/4/19.
//  Copyright © 2017年 段凯. All rights reserved.
//

#import "OrderFoodModel.h"
#import "LWParserJsonManager.h"
@implementation OrderFoodModel
-(void)getMenuTypesModelFromDataArr:(NSArray *)dataArr;
{
       self.menuTypesModelArr = [LWParserJsonManager parserJsonDateInArray:dataArr ToModel:[OrderFoodMenuTypeModel class]];
}
-(void)getShopInfoModelFromDataDic:(NSDictionary *)dataDic
{
  _shopInfoModel =  [LWParserJsonManager parserJsonDate:dataDic ToModel:[OrderFoodShopInfoModel class]];
}
@end

@implementation OrderFoodMenuTypeModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"goods_item"]) {
        NSLog(@"%@",value);
        _menusModelArr = [LWParserJsonManager parserJsonDateInArray:value ToModel:[OrderFoodMenuModel class]];
    }
}

@end

@implementation OrderFoodMenuModel
//-(void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    if ([key isEqualToString:@"shop_num"]) {
//        _shopNum = [value integerValue];
//    }
//}

@end

@implementation OrderFoodShopInfoModel
//-(NSString *)peopleNumStr
//{
//    if (!_peopleNumStr) {
//        _peopleNumStr = @"";
//    }
//    return _peopleNumStr;
//}
//-(NSString *)remarkStr
//{
//    if (!_remarkStr) {
//        _remarkStr = @"";
//    }
//    return _remarkStr;
//}
//-(NSString *)shopType
//{
//    if (!_shopType) {
//        _shopType = @"1";
//    }
//    return _shopType;
//}

//-(void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    
//}
@end

