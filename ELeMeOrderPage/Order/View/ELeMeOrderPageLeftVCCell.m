//
//  ELeMeOrderPageLeftVCCell.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ELeMeOrderPageLeftVCCell.h"
#import "Header.h"
@implementation ELeMeOrderPageLeftVCCell



@end

@implementation ELeMeOrderPageLeftVCRightCell

{
    UIImageView *_goodsImageView;//商品图片视图
    UILabel *_titleLable;//商品标题Lable
    UILabel *_saleNumberLable;//销量Lable
    UILabel *_priceLable;//价格Lable
    UILabel *_shopNumberLable;//购买量Lable
    UIBezierPath *_path;
    
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
        
    }
    return self;
}


//创建子视图

-(void)createSubViews
{
    
    
    //创建商品图片视图
    _goodsImageView = [[UIImageView alloc]init];
    //    _goodsImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_goodsImageView];
    //创建lable视图
    NSArray *textColorStrArr = @[UIColor_333333,UIColor_666666,UIColor_fe4900,UIColor_333333];
    
    NSArray *textFontArr = @[[UIFont systemFontOfSize:15],[UIFont systemFontOfSize:11],[UIFont systemFontOfSize:14],[UIFont systemFontOfSize:14]];
    for (int i = 0; i < 4; i++) {
        UILabel *lable = [[UILabel alloc]init];
        lable.textColor = textColorStrArr[i];
        lable.font = textFontArr[i];
        [self.contentView addSubview:lable];
        
        switch (i) {
            case 0:
                
                _titleLable = lable;
                break;
            case 1:
                _saleNumberLable = lable;
                break;
            case 2:
                _priceLable = lable;
                break;
            case 3:
                lable.textAlignment = NSTextAlignmentCenter;
                
                _shopNumberLable = lable;
                break;
                
            default:
                break;
        }
    }
    //创建Button视图
    for (int i = 0; i < 2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        
        [self.contentView addSubview:button];
        [button setImage:[UIImage imageNamed:i==0?@"02-8减":@"02-8加"] forState: UIControlStateNormal];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside ];
        switch (i) {
            case 0:
               
                button.userInteractionEnabled = NO;
                _minusButton = button;
                
                
                break;
            case 1:
               
                _addButton = button;
                break;
            default:
                break;
        }
        
    }
    
    //添加约束
    //商品图片视图约束
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.left.equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(55, 55));
    }];
    //商品标题Lable约束
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@12);
        make.left.mas_equalTo(_goodsImageView.mas_right).with.offset(10);
        make.right.equalTo(@-10);
        make.height.mas_equalTo(16);
    }];
    //销量lable约束
    [_saleNumberLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLable.mas_bottom).with.offset(7);
        make.left.mas_equalTo(_goodsImageView.mas_right).with.offset(10);
        make.right.equalTo(@-10);
        make.height.mas_equalTo(12);
    }];
    
    //售价lable约束
    [_priceLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_saleNumberLable.mas_bottom).with.offset(7);
        make.left.mas_equalTo(_goodsImageView.mas_right).with.offset(10);
        make.height.mas_equalTo(16);
    }];
    
    //加Button约束
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_priceLable.mas_centerY).with.offset(-2);
        make.right.equalTo(@-10);
        make.size.mas_equalTo(CGSizeMake(22, 22));
        
    }];
    
    //购买量Lable约束
    //    [_shopNumberLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_shopNumberLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_priceLable.mas_centerY).with.offset(-2);
        make.right.mas_equalTo(_addButton.mas_left).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(32, 16));
        
    }];
    [_minusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_priceLable.mas_centerY).with.offset(-2);
        make.right.equalTo(@-10);
        make.size.mas_equalTo(CGSizeMake(22, 22));
        
    }];
    [self layoutIfNeeded];
}

//重写set方法
-(void)setGoodsImgUrlStr:(NSString *)goodsImgUrlStr
{
    _goodsImgUrlStr = goodsImgUrlStr;
    _goodsImageView.image = [UIImage imageNamed:@"foodMsg.jpg"];
    
//    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:goodsImgUrlStr] placeholderImage:PLACEHODLEIMG];
    
    
    
}
-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    _titleLable.text = titleStr;
}
-(void)setSaleNumberStr:(NSString *)saleNumberStr
{
    _saleNumberStr = saleNumberStr;
    
    _saleNumberLable.text = [NSString stringWithFormat:@"已售%ld份",(long)[saleNumberStr integerValue]];
}
-(void)setPriceStr:(NSString *)priceStr
{
    _priceStr = priceStr;
#warning 精确度
    _priceLable.text = [NSString stringWithFormat:@"¥%@",priceStr];;
    
    
}

-(void)setShopNumberStr:(NSString *)shopNumberStr
{
    if (_isFirst) {
        if ([shopNumberStr integerValue]>0) {
            [_minusButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(@(-10-67));
            }];
            _minusButton.hidden = NO;
            _minusButton.userInteractionEnabled = YES;
            [self layoutIfNeeded];
            
        }
        else
        {
            [_minusButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(@(-10));
            }];
            CGPoint center = _addButton.center;
            _minusButton.userInteractionEnabled = NO;
            _minusButton.center = center;
            _minusButton.hidden  = YES;
            [self layoutIfNeeded];
        }
        //        CGPoint minusButtonCenter = _minusButton.center;
        _isFirst = NO;
    }
    else
    {
        CGPoint addButtonCenter = _addButton.center;
        CGPoint minusButtonCenter = _minusButton.center;
        BOOL isZero = CGPointEqualToPoint(addButtonCenter,   CGPointZero);
        BOOL isEqualAddCenter = CGPointEqualToPoint(addButtonCenter,minusButtonCenter);
        
        if (!isZero&&isEqualAddCenter&&[shopNumberStr integerValue]>[_shopNumberStr integerValue]&&[shopNumberStr integerValue]==1) {
            ;
            _minusButton.hidden = NO;
            
            _minusButton.center = _addButton.center;
            [self joinLineShowAnimationendPoint:CGPointMake(_minusButton.center.x-67, _minusButton.center.y) animationView:_minusButton startAlpha:0.1 endAlpha:1];
        }
        else if([shopNumberStr integerValue]<[_shopNumberStr integerValue]&&!isZero&&[shopNumberStr integerValue]<=0)
        {
            _minusButton.userInteractionEnabled = NO;
            [self joinLineShowAnimationendPoint:CGPointMake(_addButton.center.x, _minusButton.center.y) animationView:_minusButton startAlpha:0.1 endAlpha:1];
        }
        
    }
    _shopNumberStr = shopNumberStr;
    _shopNumberLable.text = [shopNumberStr integerValue]>0 ? shopNumberStr : @"";
}
//button点击事件Bloak
-(void)clickButtonBloak:(clickButtonBloak)addButtonBloak
{
    _buttonBloak = addButtonBloak;
    
}


//响应button点击事件
-(void)clickButton:(UIButton *)sender
{
    
    if (sender==_addButton) {
        if (_buttonBloak) {
            _buttonBloak(1);
        }
        
        
    }
    else
    {
        if (_buttonBloak) {
            _buttonBloak(-1);
        }
        
    }
    
    
}
//动画
-(void)joinLineShowAnimationendPoint:(CGPoint)endPoint animationView:(UIView *)animationView startAlpha:(CGFloat)startAlpha endAlpha:(CGFloat)endAlpha
{
    CGFloat endPoint_x = endPoint.x;
    CGFloat endPoint_y = endPoint.y;
    
    CGFloat startX = animationView.center.x;
    CGFloat startY = animationView.center.y;
    
    _path= [UIBezierPath bezierPath];
    [_path moveToPoint:CGPointMake(startX, startY)];
    
    //直线线
    [_path addLineToPoint:CGPointMake(endPoint_x, endPoint_y)];
    
    
    [self.layer addSublayer:_minusButton.layer];
    [self grouaAnimationWithAnimationView:animationView startAlpha:startAlpha endAlpha:endAlpha] ;
}
#pragma mark - 组合动画
-(void)grouaAnimationWithAnimationView:(UIView *)animationView startAlpha:(CGFloat)startAlpha endAlpha:(CGFloat)endAlpha
{
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    // 设定旋转角度
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI]; // 终止角度
    //   [_addButton.layer addAnimation:rotationAnimation forKey:@"rotate-layer"];
    
    //    return;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = _path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.duration = 0.1f;
    alphaAnimation.fromValue = [NSNumber numberWithFloat:startAlpha];
    alphaAnimation.toValue = [NSNumber numberWithFloat:endAlpha];
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,alphaAnimation, rotationAnimation];
    groups.duration = 0.4f;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    //    groups.delegate = self;
    [groups setValue:@"groupsAnimation" forKey:@"animationName"];
    [animationView.layer addAnimation:groups forKey:nil];
    [self performSelector:@selector(animationDidEnd) withObject:animationView.layer afterDelay:0.4f];
    
}
-(void)animationDidEnd
{
    if (_minusButton.hidden ==NO&& CGPointEqualToPoint(_minusButton.center , _addButton.center)) {
        
        CGPoint center = CGPointMake(_addButton.center
                                     .x-67, _addButton.center
                                     .y);
        _minusButton.userInteractionEnabled = YES;
        _minusButton.center = center;
        
    }
    else
    {
        
        CGPoint center = _addButton.center;
        _minusButton.userInteractionEnabled = NO;
        _minusButton.center = center;
        _minusButton.hidden  = YES;
    }
}


@end

@implementation ELeMeOrderPageLeftVCLeftCell

{
    UILabel *_textLable;
}
//重写初始化函数
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect frame = self.contentView.bounds;
        _textLable = [[UILabel alloc]initWithFrame:frame];
        _textLable.textColor = UIColor_666666;
        _textLable.font = [UIFont systemFontOfSize:15];
        _textLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_textLable];
    }
    return self;
}



-(void)setText:(NSString *)text
{
    _text = text;
    
    _textLable.text = text;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = self.contentView.bounds;
    _textLable.frame = frame;
}

@end
