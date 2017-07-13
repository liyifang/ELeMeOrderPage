//
//  LWGesturePenetrationTableView.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "LWGesturePenetrationTableView.h"

@implementation LWGesturePenetrationTableView
#pragma mark --- other ---

#pragma mark --- other ---
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
@end
