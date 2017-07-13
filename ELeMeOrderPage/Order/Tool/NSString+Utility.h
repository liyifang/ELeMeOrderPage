//
//  NSString+Utility.h
//  companyRate
//
//  Created by RuiEr on 16/5/26.
//  Copyright © 2016年 招. All rights reserved.
//

#import <Foundation/Foundation.h>
#define GetNoNilString(str)  [NSString stringGetNoNilString:str]
#define GetStringFromNSInt(intNum) [NSString stringGetStringFromNSInt:intNum]
#define GetSeparatrixString(str) [NSString stringGetSeparatrixString:str]
@interface NSString (Utility)

-(BOOL)isPureFloat;
-(BOOL)isPureInt;
-(BOOL)isValidateEmail;
-(BOOL)isValidateMobile;
+(BOOL)stringIsEmptyString:(NSString *)str;
+(NSInteger)stringGetSerialNumbersFromeString:(NSString *)string;
+(NSString *)stringGetSerialNumbersStringFromeString:(NSString *)string;
+(NSString *)stringGetNoNilString:(NSString *)str;
+(NSString *)stringGetStringFromNSInt:(NSInteger)intNum;
+(NSString *)stringGetSeparatrixString:(NSString *)string;
@end
