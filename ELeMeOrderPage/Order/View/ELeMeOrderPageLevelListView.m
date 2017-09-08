//
//  LWLevelListView.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ELeMeOrderPageLevelListView.h"

#import "Header.h"

typedef  NS_ENUM(NSInteger,ButtonTag)
{
    LeftButtonTag = 101,
    RightButtonTag = 102,
   
};


@implementation ELeMeOrderPageLevelListView
{
    
    UIView *_lineView;
    BOOL _isClickButton;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createSubView];
    }
    return self;
}
-(void)createSubView
{
    
    CGFloat width = 80;
    CGFloat x = self.bounds.size.width/4-width/2;
    CGFloat height = self.bounds.size.height;
    
    //button
    for (int i = 0; i < 2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:button];
        //添加响应事件
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        //设置button其他属性
        button.frame = CGRectMake(x+(width/2+self.bounds.size.width/3)*i, 0, width, height);
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitle:(i==0?@"点菜":@"商家") forState:   UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"#666666"] forState: UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"#0398ff"] forState: UIControlStateSelected];
        switch (i) {
            case 0:
                
                button.selected = YES;
                button.tag = LeftButtonTag;
                _leftButton = button;
                
                break;
            case 1:
                button.tag = RightButtonTag;
                _rightButton = button;
                break;
            default:
                break;
        }
    }
    //lineView
    CGFloat  y = self.bounds.size.height - 2;
    x = _leftButton.frame.origin.x;
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, 2)];
    [self addSubview:_lineView];
    _lineView.backgroundColor = [UIColor colorWithHexString:@"#0398ff"];
    
    UIView *bottomLineView = [[UIView alloc]initWithFrame:CGRectMake(0, height-0.5, ScreenWidth, 0.5)];
    bottomLineView.backgroundColor = [UIColor colorWithHexString:@"#cccccc"];
    [self addSubview:bottomLineView];
    
}

-(void)clickButton:(UIButton *)sender
{
  
    BOOL isLeftButton =  _leftButton==sender  ? YES : NO;//判断点击的是否是LeftButton
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(selectedButton:)]) {
        [self.delegate selectedButton:isLeftButton];
    }
    ;
//    [self changeLineViewFrame];
}


-(void)changeLineViewOffsetX:(CGFloat)offsetX
{
    CGFloat width = 80;
    CGRect linViewFrame = _lineView.frame;
    CGFloat x = self.bounds.size.width/4-width/2 + (width/2+self.bounds.size.width/3)*(offsetX/ScreenWidth);
    
    //修改_lineView.frame
   
    linViewFrame.origin.x = x;    //
    _lineView.frame =  linViewFrame;
    
    if (offsetX==0||offsetX==ScreenWidth) {
        _leftButton.selected = offsetX/ScreenWidth ==0 ? YES : NO;
        _rightButton.selected = !_leftButton.selected;
    }
    
        

    
}


@end
