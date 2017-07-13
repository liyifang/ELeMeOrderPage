//
//  OrderFoodModel.h
//  Persion
//
//  Created by liyifang on 2017/4/19.
//  Copyright © 2017年 段凯. All rights reserved.
//

#import <Foundation/Foundation.h>
@class OrderFoodShopInfoModel;
@interface OrderFoodModel : NSObject
@property(nonatomic, strong)NSArray *menuTypesModelArr;
//@property(nonatomic, strong)NSArray *shopCarMenuModelsArr;
//@property(nonatomic, strong)NSString *totalMealMoneyStr;
@property(nonatomic, strong)OrderFoodShopInfoModel *shopInfoModel;
-(void)getMenuTypesModelFromDataArr:(NSArray *)dataArr;
-(void)getShopInfoModelFromDataDic:(NSDictionary *)dataDic;
;
@end

@interface OrderFoodMenuTypeModel : NSObject
@property(nonatomic, strong)NSString *goods_type;
@property(nonatomic, strong)NSArray *menusModelArr;
@end

@interface OrderFoodMenuModel : NSObject
@property(nonatomic, strong)NSString *goods_id;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *pic;
@property(nonatomic, strong)NSString *sales;
@property(nonatomic, strong)NSString *price;
@property(nonatomic, strong)NSString *type;
@property(nonatomic, assign)NSInteger shopNum;
@property(nonatomic, strong)NSIndexPath *indexPath;
@end

@interface OrderFoodShopInfoModel : NSObject//商铺信息
@property(nonatomic, strong)NSString *jo_id;//商铺ID
@property(nonatomic, strong)NSString *name;//商铺名称
@property(nonatomic, strong)NSString *pic;//图片
@property(nonatomic, strong)NSString *deliverfee;//配送费
@property(nonatomic, strong)NSString *start_price;//起送价
@property(nonatomic, strong)NSString *boxfee;//餐盒费
@property(nonatomic, strong)NSString *comment;//商铺备注
@property(nonatomic, strong)NSString *goodscore;//商品评分
@property(nonatomic, strong)NSString *serverscore;//服务评分
@property(nonatomic, strong)NSString *peopleNumStr;
@property(nonatomic, strong)NSString *remarkStr;
@property(nonatomic, strong)NSString *shopType;
@property(nonatomic, strong)NSArray *shopCarMenuModelsArr;//购车
@property(nonatomic, strong)NSString *totalMealMoneyStr;//所有食品总价

@property(nonatomic, strong)NSString *total_score;
@property(nonatomic, strong)NSString *notice;
@property(nonatomic, strong)NSString *tel;
@property(nonatomic, strong)NSString *address;
@end
