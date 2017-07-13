//
//  AddressModel.m
//  Persion
//
//  Created by liyifang on 2017/5/3.
//  Copyright © 2017年 段凯. All rights reserved.
//

#import "AddressModel.h"

@implementation AddressModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
-(NSString *)totalAddress
{
    _totalAddress = [NSString stringWithFormat:@"%@ %@ %@ %@",_province?_province:@"",_city?_city:@"",_county?_county:@"",_address?_address:@""];
    return _totalAddress;
}
-(NSString *)PCCAddress
{
    _PCCAddress = [NSString stringWithFormat:@"%@ %@ %@",_province?_province:@"",_city?_city:@"",_county?_county:@""];
    return _PCCAddress;
}
@end
