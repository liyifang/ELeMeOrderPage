//
//  LWParserJsonManager.h
//  companyRate
//
//  Created by RuiEr on 16/5/5.
//  Copyright © 2016年 招. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LWParserJsonManager : NSObject

+(id)parserJsonDate:(NSDictionary *)date ToModel:(Class)modeClass;;
+(id)parserJsonDateInArray:(NSArray *)dateArray ToModel:(Class)modeClass;


@end
