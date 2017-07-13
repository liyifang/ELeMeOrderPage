//
//  ELeMeOrderPageRightVCCell.h
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELeMeOrderPageRightVCCell : UITableViewCell//普通Cell
@property(nonatomic, strong)NSString *titleStr;
@property(nonatomic, strong)NSString *detailStr;
@end

@interface ELeMeOrderPageRightVCScoreCell : UITableViewCell//评分Cell
@property(nonatomic, strong)NSString *overallScoreStr;
@property(nonatomic, strong)NSString *goodsScoreStr;
@property(nonatomic, strong)NSString *serviceScoreStr;
@end


@interface ELeMeOrderPageRightVCCommentCell : UITableViewCell//评论Cell
@property(nonatomic, strong)NSString *headerImgUrlStr;
@property(nonatomic, strong)NSString *nameStr;
@property(nonatomic, strong)NSString *dateStr;
@property(nonatomic, strong)NSString *commentStr;
@property(nonatomic, strong)NSString *commentScore;
@end


@interface ELeMeOrderPageRightVCNoticeCell : UITableViewCell
@property(nonatomic, strong)UILabel *noticeLable;
@property(nonatomic, strong)NSString *noticeStr;
@end

