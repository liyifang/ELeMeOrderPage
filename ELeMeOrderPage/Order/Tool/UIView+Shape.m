//
//  UIView+Shape.m
//  Us1314
//
//  Created by RuiEr on 16/7/19.
//  Copyright © 2016年 RuiEr. All rights reserved.
//

#import "UIView+Shape.h"

@implementation UIView (Shape)
-(void)viewCircleViewBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor
{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat circleRadius = (width<height)?width/2:height/2;
    [self viewCornerRadiusViewWithRadius:circleRadius andBorderWidth:borderWidth andBorderColor:borderColor];
//    self.layer.cornerRadius = circleRadius;
//    self.layer.borderWidth = borderWidth?borderWidth:0;
//    self.clipsToBounds = YES;
//    if (borderColor) {
//        self.layer.borderColor = borderColor.CGColor;
//    }
   
}
-(void)viewCornerRadiusViewWithRadius:(CGFloat)radius andBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor
{
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = borderWidth?borderWidth:0;
    self.clipsToBounds = YES;
    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }

}

-(void)viewDottedLineBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor
{
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[LWCustomShapeLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
    LWCustomShapeLayer *border = [LWCustomShapeLayer layer];
    
    border.strokeColor = borderColor.CGColor;
    
    border.fillColor = nil;
    
    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    CGRect frame = self.bounds;
    border.frame = frame;
    
    border.lineWidth = borderWidth;
   
    border.lineCap = @"square";
    //虚线
    border.lineDashPattern = @[@8, @6];
    //实线
    // border.lineDashPattern = nil;
    [self.layer addSublayer:border];
    
 
    UIGraphicsEndImageContext();
}

-(void)viewDottedLineBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor andlineDashPattern:(NSArray<NSNumber *> *)lineDashPattern
{
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[LWCustomShapeLayer class]]) {
            [layer removeFromSuperlayer];
        }
    }
    LWCustomShapeLayer *border = [LWCustomShapeLayer layer];
    
    border.strokeColor = borderColor.CGColor;
    
    border.fillColor = nil;
    
    border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    CGRect frame = self.bounds;
    border.frame = frame;
    
    border.lineWidth = borderWidth;
    
    border.lineCap = @"square";
    //虚线
    border.lineDashPattern = lineDashPattern ;
    //实线
    // border.lineDashPattern = nil;
    [self.layer addSublayer:border];
    
   
    UIGraphicsEndImageContext();
}
@end

@implementation LWCustomShapeLayer



@end
