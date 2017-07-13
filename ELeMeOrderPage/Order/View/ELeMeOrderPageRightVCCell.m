//
//  ELeMeOrderPageRightVCCell.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ELeMeOrderPageRightVCCell.h"
#import "Header.h"
#import "LWStarsView.h"
#import "LWLabel.h"
@implementation ELeMeOrderPageRightVCCell
{
    UILabel *_titleLable;
    UILabel *_detailLable;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubViews];
    }
    return self;
}
-(void)addSubViews
{
    for (int i = 0; i < 2; i++) {
        UILabel *lable = [[UILabel alloc]init];
        lable.textColor = i == 0? UIColor_999999:UIColor_333333;
        lable.font = [UIFont systemFontOfSize:14];
        [self addSubview:lable];
        switch (i) {
            case 0:
                _titleLable = lable;
                break;
            case 1:
                lable.textAlignment = NSTextAlignmentCenter;
                _detailLable = lable;
                break;
            default:
                break;
        }
    }
   
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.width.mas_equalTo(40);
    }];
    [_detailLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_detailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLable.mas_right).with.offset(5);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
    }];
}
-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    _titleLable.text = titleStr;
    
}

-(void)setDetailStr:(NSString *)detailStr
{
    _detailStr = detailStr;
    _detailLable.text = detailStr;
}


@end

@implementation ELeMeOrderPageRightVCScoreCell//评分Cell
{
    UILabel *_overallScoreLable;
    UILabel *_overallTitleLable;
    UILabel *_goodsTitleLable;
    UILabel *_goodsScoreLable;
    UILabel *_serviceTitleLable;
    UILabel *_serviceScoreLable;
    LWStarsView *_goodsStarsView;
    LWStarsView *_serviceStarsView;
    UIView *_VLineView;
    
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubViews];
    }
    return self;
}
-(void)addSubViews
{
    CGFloat height = self.bounds.size.height;
    //添加 lable 视图
    NSArray *colorArr = @[UIColor_fe4900,UIColor_666666,UIColor_666666,UIColor_fe4900,UIColor_666666,UIColor_fe4900,UIColor_666666,UIColor_666666];
    for (int i = 0; i < 6; i++) {
        UILabel *lable = [[UILabel alloc]init];
        lable.font = i==0 ? [UIFont systemFontOfSize:20] : [UIFont systemFontOfSize:11];
        lable.textColor = colorArr[i];
        [self addSubview:lable];
        switch (i) {
            case 0:
                _overallScoreLable = lable;
                break;
            case 1:
                lable.text = @"综合评分";
                _overallTitleLable = lable;
                break;
            case 2:
                lable.text = @"商品评分:";
                _goodsTitleLable = lable;
                break;
            case 3:
                _goodsScoreLable = lable;
                break;
            case 4:
                lable.text = @"服务评分:";
                _serviceTitleLable = lable;
                break;
            case 5:
                _serviceScoreLable = lable;
                break;
            default:
                break;
        }
    }
    //添加星星视图
    for (int i = 0; i < 2; i++) {
        LWStarsView *starsView = [[LWStarsView alloc]init];
        [self addSubview:starsView];
        switch (i) {
            case 0:
                _goodsStarsView = starsView;
                break;
            case 1:
                _serviceStarsView = starsView;
                break;
            default:
                break;
        }
    }
    CGFloat space = (ScreenWidth - 203.5-0.5)/4;
    _VLineView = [[UIView alloc]initWithFrame:CGRectMake(0, 15, 0.5, height-60)];
    _VLineView.backgroundColor = UIColor_999999;
    [self addSubview:_VLineView];
    //添加约束
    //_overallScoreLable
    [_overallScoreLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_overallScoreLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.centerX.mas_equalTo(_overallTitleLable.mas_centerX).with.offset(0);
        make.height.mas_equalTo(22);
    }];
    
    //_overallTitleLable
    [_overallTitleLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_overallTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_overallScoreLable.mas_bottom).with.offset(6);
        make.left.mas_equalTo(space);
        make.height.mas_equalTo(22);
    }];
    //_goodsTitleLable
    [_goodsTitleLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_goodsTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@30);
        make.right.mas_equalTo(_goodsStarsView.mas_left).with.offset(-5);
        make.height.mas_equalTo(12);
    }];
    //_goodsStarsView
    [_goodsStarsView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_goodsTitleLable.mas_centerY).with.offset(0);
        make.right.mas_equalTo(_goodsScoreLable.mas_left).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(12*5+1*4, 12));
    }];
    //_goodsScoreLable
    [_goodsScoreLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_goodsScoreLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_goodsTitleLable.mas_centerY).with.offset(0);
        make.right.mas_equalTo(-space);
        make.height.mas_equalTo(12);
    }];
    //_serviceTitleLable
    [_serviceTitleLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_serviceTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_overallTitleLable.mas_top).with.offset(0);
        make.right.mas_equalTo(_serviceStarsView.mas_left).with.offset(-5);
        make.height.mas_equalTo(12);
    }];
    //_serviceStarsView
    [_serviceStarsView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_serviceTitleLable.mas_centerY).with.offset(0);
        
        make.right.mas_equalTo(_serviceScoreLable.mas_left).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(12*5+1*4, 12));
    }];
    
    //_serviceScoreLable
    [_serviceScoreLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_serviceScoreLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(_serviceTitleLable.mas_centerY).with.offset(0);
        make.right.mas_equalTo(-space);
        
        make.height.mas_equalTo(12);
    }];
}

//重写set
-(void)setOverallScoreStr:(NSString *)overallScoreStr
{
    _overallScoreStr = overallScoreStr;
    
    _overallScoreLable.text = [NSString stringWithFormat:@"%0.1f",[overallScoreStr floatValue]];
}

-(void)setGoodsScoreStr:(NSString *)goodsScoreStr
{
    _goodsScoreStr = goodsScoreStr;
    
    _goodsStarsView.goodNum = [goodsScoreStr floatValue];
    _goodsScoreLable.text = [NSString stringWithFormat:@"%0.1f分",[goodsScoreStr floatValue]];
}

-(void)setServiceScoreStr:(NSString *)serviceScoreStr
{
    _serviceScoreStr = serviceScoreStr;
    
    _serviceStarsView.goodNum = [serviceScoreStr floatValue];
    _serviceScoreLable.text = [NSString stringWithFormat:@"%0.1f分",[serviceScoreStr floatValue]];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat height = self.bounds.size.height - 30;
    CGFloat overallLableMaxX = CGRectGetMaxX(_overallTitleLable.frame);
    CGFloat goodsTitlelableX = _goodsTitleLable.frame.origin.x;
    CGRect frame = _VLineView.frame;
    frame.origin.y = 15;
    frame.origin.x = overallLableMaxX + (goodsTitlelableX-overallLableMaxX)/2-0.25;
    frame.size.height = height;
    _VLineView.frame = frame;
}
@end

@implementation ELeMeOrderPageRightVCCommentCell
{
    UIImageView *_headerImageView;
    UILabel *_nameLable;
    UILabel *_datelable;
    UILabel *_detailLable;
    LWStarsView *_starsView;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubViews];
    }
    return self;
}

-(void)addSubViews
{
    NSArray *fontArr = @[[UIFont systemFontOfSize:15],[UIFont systemFontOfSize:13],[UIFont systemFontOfSize:14]];
    NSArray *colorArr = @[UIColor_333333,UIColor_999999,UIColor_666666];
    for (int i = 0; i < 3; i++) {
        UILabel *lable = [[UILabel alloc]init];
        lable.font = fontArr[i];
        lable.textColor = colorArr[i];
        [self addSubview:lable];
        switch (i) {
            case 0:
                _nameLable = lable;
                break;
            case 1:
                _datelable = lable;
                break;
            case 2:
                lable.numberOfLines = 0;
                
                _detailLable = lable;
                break;
            default:
                break;
        }
    }
    
    _starsView = [[LWStarsView alloc]init];
    [self addSubview:_starsView];
    
    _headerImageView = [[UIImageView alloc]init];
    _headerImageView.backgroundColor = [UIColor redColor];
    [self addSubview:_headerImageView];
    
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [_nameLable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.mas_equalTo(_headerImageView.mas_right).with.offset(10);
        make.height.mas_equalTo(16);
        
    }];
    
    [_datelable setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_datelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_nameLable.mas_centerY).with.offset(0);
        make.right.equalTo(@-10);
    }];
    
    [_starsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_nameLable.mas_bottom).with.offset(6);
        make.left.mas_equalTo(_headerImageView.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(11*5+3*4, 11));
    }];
    
    [_detailLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_starsView .mas_bottom).with.offset(5);
        make.left.mas_equalTo(_headerImageView.mas_right).with.offset(10);
        make.right.equalTo(@-10);
        make.bottom.mas_equalTo(-5);
    }];
}
// 重写set
-(void)setHeaderImgUrlStr:(NSString *)headerImgUrlStr
{
    _headerImgUrlStr = headerImgUrlStr;
//    [_headerImageView sd_setImageWithURL:[NSURL URLWithString:headerImgUrlStr] placeholderImage:PLACEHODLEIMG];
}
-(void)setNameStr:(NSString *)nameStr
{
    _nameStr = nameStr;
    _nameLable.text = nameStr;
}
-(void)setDateStr:(NSString *)dateStr
{
    _dateStr = dateStr;
    _datelable.text = dateStr;
}

-(void)setCommentStr:(NSString *)commentStr
{
    _commentStr = commentStr;
    _detailLable.text = commentStr;
}
-(void)setCommentScore:(NSString *)commentScore
{
    _commentScore = commentScore;
    NSInteger score = roundf([commentScore floatValue]);
    _starsView.goodNum = score;
}
//

//
-(void)layoutSubviews
{
    [super layoutSubviews];
    [_headerImageView viewCircleViewBorderWidth:0 andBorderColor:nil];
}


@end

@implementation ELeMeOrderPageRightVCNoticeCell

-(instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat width = self.bounds.size.width;
        LWLabel *lable = [[LWLabel alloc]init];
        [self.contentView addSubview:lable];
        lable.backgroundColor = UIColor_f2f2f2;
        [lable setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        lable.preferredMaxLayoutWidth = width - 30;
        lable.numberOfLines = 0;
        lable.edgeInsets = UIEdgeInsetsMake(8, 10, 8, 10);
        [lable viewCornerRadiusViewWithRadius:4 andBorderWidth:0 andBorderColor:nil];
        _noticeLable = lable;
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
            make.bottom.equalTo(@0);
            make.left.equalTo(@15);
            make.right.equalTo(@-15);
            
        }];
        
        
    }
    
    return self;
}

-(void)setNoticeStr:(NSString *)noticeStr
{
    _noticeStr = noticeStr;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 6;
    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:noticeStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:UIColor_666666,NSParagraphStyleAttributeName:paragraphStyle}];
    _noticeLable.attributedText = attributedString;
}

@end

