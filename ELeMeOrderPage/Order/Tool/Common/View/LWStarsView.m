//
//  LWStarsView.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "LWStarsView.h"

@implementation LWStarsView
{
    NSArray *_starImageViewsArr;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addViews];
    }
    return self;
}
-(void)addViews
{
    CGSize starImgVSize = CGSizeMake(12, 12);
    CGFloat starSpace = 1;
    CGFloat x = 0;
    NSMutableArray *starImgVsMuArr = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        UIImageView *starImgV = [[UIImageView alloc]initWithFrame:CGRectMake(x, 0, starImgVSize.width, starImgVSize.width)];
        
        [self addSubview:starImgV];
        [starImgVsMuArr addObject:starImgV];
        x += (starImgVSize.width + starSpace);
    }
    _starImageViewsArr = [starImgVsMuArr copy];
}

-(void)setGoodNum:(CGFloat)goodNum
{
    _goodNum = goodNum;
    
    [_starImageViewsArr enumerateObjectsUsingBlock:^(UIImageView *imgV, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat chaNum = goodNum -idx;
        if (chaNum >= 1) {
            imgV.image = [UIImage imageNamed:@"ratingbar_selected"];
        }
        else if (chaNum>0)
        {
            imgV.image = [UIImage imageNamed:@"ratingbar_halfSelected"];
        }
        else
        {
            imgV.image = [UIImage imageNamed:@"ratingbar_unselected"];
        }
    }];
}

@end
