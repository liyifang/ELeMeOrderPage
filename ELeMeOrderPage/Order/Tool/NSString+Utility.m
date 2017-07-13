//
//  NSString+Utility.m
//  companyRate
//
//  Created by RuiEr on 16/5/26.
//  Copyright © 2016年 招. All rights reserved.
//

#import "NSString+Utility.h"

@implementation NSString (Utility)
//判断是否为空
+(BOOL)stringIsEmptyString:(NSString *)str
{
    if (str==nil||[str isEqual:@""]) {
        return YES;
    }
    else
    {
        return NO;
    }
}
//判断是否为整形：

- (BOOL)isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：

- (BOOL)isPureFloat
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

//判断是否为邮箱
- (BOOL)isValidateEmail
{
        NSString *emailCheck =@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
        return [emailTest evaluateWithObject:self];
}

//验证是不是正确手机号
-(BOOL)isValidateMobile
{
    if (self.length < 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:self];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:self];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:self];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
    return NO;
}
//
+(NSInteger)stringGetSerialNumbersFromeString:(NSString *)string
{
    if (!string) {
        return 0;
    }
    NSString *str = string;
    NSScanner *scanner = [NSScanner scannerWithString:str];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    int number;
    [scanner scanInt:&number];
    return number;
}

+(NSString *)stringGetSerialNumbersStringFromeString:(NSString *)string
{
    if (!string||[string isEqualToString:@""]) {
        return @"0";
    }
    NSScanner *scanner = [NSScanner scannerWithString:string];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    int number;
    [scanner scanInt:&number];
    if (!number) {
        number = 0;
    }
    NSString *numStr = [NSString stringWithFormat:@"%d",number];
    if ([numStr isEqualToString:@"0"]) {
        numStr = @"";
    }
    return [NSString stringWithFormat:@"%d",number];
}

+(NSString *)stringGetNoNilString:(NSString *)str
{
    if (!str||[str isKindOfClass:[NSNull class]]) {
        str = @"";
        
    }
    str = [NSString stringWithFormat:@"%@",str];
    return str;
}

+(NSString *)stringGetStringFromNSInt:(NSInteger)intNum
{
    NSString *str;
    if (!intNum) {
        str = @"0";
        return str;
    }
    str = [NSString stringWithFormat:@"%ld",(long)intNum];
    return str;

}

+(NSString *)stringGetSeparatrixString:(NSString *)string
{
    if (!string||string.length==0) {
        return @"";
    }
    NSMutableString *newString = [NSMutableString stringWithFormat:@""];
    NSMutableString *muString = [string mutableCopy];
    NSString *pointStr = @".";
    NSRange pointRange = [muString rangeOfString:pointStr];
    if (pointRange.length) {
      NSString *decimalStr =  [muString substringFromIndex:pointRange.location];
        NSRange decimalRange = [muString rangeOfString:decimalStr];
        [newString appendString:decimalStr];
        [muString deleteCharactersInRange:decimalRange];
    }
    
 
    while (muString.length>3) {
        NSString *partStr = [muString substringFromIndex:(muString.length-3)];
     
        if (![NSString stringIsEmptyString:newString]) {
            [newString insertString:@"," atIndex:0];
        }
      
        
        [newString insertString:partStr atIndex:0];
        [muString deleteCharactersInRange:NSMakeRange(muString.length-3, 3)];
    }
   
    if (![NSString stringIsEmptyString:newString]) {
          [newString insertString:@"," atIndex:0];
    }
  
    [newString insertString:muString atIndex:0];
    NSString *returnStr = [newString copy];
    returnStr =  [returnStr stringByReplacingOccurrencesOfString:@",." withString:@"."];
    return returnStr;
}
@end
