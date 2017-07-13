//
//  AddressModel.h
//  Persion
//
//  Created by liyifang on 2017/5/3.
//  Copyright © 2017年 段凯. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressModel : NSObject
@property(nonatomic, strong)NSString *totalAddress;
@property(nonatomic, strong)NSString *PCCAddress;//省市区
@property(nonatomic, strong)NSString *delivery_addr_id;//地址ID
@property(nonatomic, strong)NSString *province;//省
@property(nonatomic, strong)NSString *provinceCode;//省编码
@property(nonatomic, strong)NSString *city;//市
@property(nonatomic, strong)NSString *cityCode;//市编码,
@property(nonatomic, strong)NSString *county;//县／区,
@property(nonatomic, strong)NSString *countyCode;//县／区编号,
@property(nonatomic, strong)NSString *address;//详细地址,
@property(nonatomic, strong)NSString *reciver;//收货人
@property(nonatomic, strong)NSString *tel;//联系方式
@property(nonatomic, strong)NSString *defaultAddr;//是否为默认地址

@end
