//
//  UIView+Shape.h
//  Us1314
//
//  Created by RuiEr on 16/7/19.
//  Copyright © 2016年 RuiEr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shape)
-(void)viewCircleViewBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor;
-(void)viewCornerRadiusViewWithRadius:(CGFloat)radius andBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor;
-(void)viewDottedLineBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor;
-(void)viewDottedLineBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor andlineDashPattern:(NSArray<NSNumber *> *)lineDashPattern;
@end

@interface LWCustomShapeLayer : CAShapeLayer

@end
