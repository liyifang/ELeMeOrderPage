//
//  Header.h
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#ifndef Header_h
#define Header_h

//手机屏幕宽高
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height


//tableview偏移类型
typedef NS_ENUM(NSInteger, OffsetType) {
    OffsetTypeMin,
    OffsetTypeCenter,
    OffsetTypeMax,
};
//颜色
#define UIColor_fe4900 [UIColor colorWithHexString:@"#fe4900"]
#define UIColor_999999 [UIColor colorWithHexString:@"#999999"]
#define UIColor_666666 [UIColor colorWithHexString:@"#666666"]
#define UIColor_333333 [UIColor colorWithHexString:@"#333333"]
#define UIColor_cccccc [UIColor colorWithHexString:@"#cccccc"]
#define UIColor_0398ff [UIColor colorWithHexString:@"#0398ff"]
#define UIColor_f2f2f2 [UIColor colorWithHexString:@"#f2f2f2"]
//头文件
#import "OrderFoodModel.h"
#import "ShoppingMalAllModel.h"


#import "LWGesturePenetrationTableView.h"

#import "UIColor+ColorChange.h"
#import "UIView+Shape.h"
#import "NSString+Utility.h"

#import "Masonry.h"
#endif /* Header_h */
