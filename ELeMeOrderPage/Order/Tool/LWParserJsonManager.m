//
//  LWParserJsonManager.m
//  companyRate
//
//  Created by RuiEr on 16/5/5.
//  Copyright © 2016年 招. All rights reserved.
//

#import "LWParserJsonManager.h"

@implementation LWParserJsonManager
+(id)parserJsonDate:(NSDictionary *)date ToModel:(Class)modeClass
{
    if (![date isKindOfClass:[NSDictionary class]]) {
        return nil ;
    }
    id modle = [[modeClass alloc]init];
    [modle setValuesForKeysWithDictionary:date];
    return modle;
}
+(id)parserJsonDateInArray:(NSArray *)dateArray ToModel:(Class)modeClass
{
    NSMutableArray *modelArray = [NSMutableArray array];
    if (![dateArray isKindOfClass:[NSArray class]]||!dateArray.count) {
        return nil;
    }
    for (NSDictionary *date in dateArray) {
        id modle = [[modeClass alloc]init];
        [modle setValuesForKeysWithDictionary:date];
        [modelArray addObject:modle];
    }
    return [modelArray copy];
}

@end
