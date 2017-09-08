//
//  ELeMeOrderPageRghtViewController.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ELeMeOrderPageRightViewController.h"
#import "ELeMeOrderPageRightVCCell.h"
#import "Header.h"

#import "ELeMeOrderPageViewMainController.h"
@interface ELeMeOrderPageRightViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)LWGesturePenetrationTableView *tableView;
@end

@implementation ELeMeOrderPageRightViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self addSubViews];
}
//添加子视图
-(void)addSubViews
{
    _tableView = [[LWGesturePenetrationTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[ELeMeOrderPageRightVCCommentCell class] forCellReuseIdentifier:@"commentCell"];
   
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    ELeMeOrderPageViewMainController *vc = (ELeMeOrderPageViewMainController *)[self parentViewController];//父控制器
    
    if (scrollView.contentOffset.y <= 0) {
        self.offsetType = OffsetTypeMin;
        scrollView.contentOffset = CGPointZero;
    } else {
        self.offsetType = OffsetTypeCenter;
    }
    
    
    if (vc.offsetType != OffsetTypeMax) {
        scrollView.contentOffset = CGPointZero;
    }
    if (vc.offsetType == OffsetTypeMax) {
        
    }
    
}


//UITableViewDelegate, UITableViewDataSource
//section数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger sectionNum = 2;
    return sectionNum;
}
//row数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowNum = 0;
    switch (section) {
        case 0:
            rowNum = 1;
            break;
        case 1:
            rowNum = 3;
            break;
        default:
            break;
    }
    return rowNum;
}
//tableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     OrderFoodShopInfoModel *shopInfoModel =  _orderFoodModel.shopInfoModel;
    if (indexPath.section==0) {
        if (indexPath.row==0) {
        ELeMeOrderPageRightVCScoreCell *scoreCell = [[ELeMeOrderPageRightVCScoreCell alloc]init];
            scoreCell.overallScoreStr = GetNoNilString(shopInfoModel.total_score);
            scoreCell.goodsScoreStr =  GetNoNilString(shopInfoModel.goodscore);
            scoreCell.serviceScoreStr = GetNoNilString(shopInfoModel.serverscore);
            scoreCell.selectionStyle = UITableViewCellSelectionStyleNone;
            scoreCell.separatorInset = UIEdgeInsetsMake(0, ScreenWidth, 0, -ScreenWidth);
            return scoreCell;
        }else if (indexPath.row==1)
        {
            ELeMeOrderPageRightVCNoticeCell *noticeCell = [[ELeMeOrderPageRightVCNoticeCell alloc]init];
            noticeCell.noticeStr = [NSString stringWithFormat:@"公告：%@",GetNoNilString(shopInfoModel.notice)];
            noticeCell.separatorInset = UIEdgeInsetsMake(0, ScreenWidth, 0, -ScreenWidth);
            noticeCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return noticeCell;
        }
        else if (indexPath.row<4)
        {
            ELeMeOrderPageRightVCCell *commonCell = [[ELeMeOrderPageRightVCCell alloc]init];
            commonCell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (indexPath.row==2) {
                commonCell.titleStr = @"电话: ";
                commonCell.detailStr = GetNoNilString(shopInfoModel.tel);
                
            }
            else
            {
                commonCell.titleStr = @"地址: ";
                commonCell.detailStr = GetNoNilString(shopInfoModel.address);
            }
            
            return commonCell;
        }
        else
        {
            
            ELeMeOrderPageRightVCCell *commonCell = [[ELeMeOrderPageRightVCCell alloc]init];
            commonCell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (indexPath.row==2) {
                commonCell.titleStr = @"电话: ";
                commonCell.detailStr = GetNoNilString(shopInfoModel.tel);
                
            }
            else
            {
                commonCell.titleStr = @"地址: ";
                commonCell.detailStr = GetNoNilString(shopInfoModel.address);
            }
            
            return commonCell;
//            OrderFoodSellerBaiDuMapCell *mapCell = [[OrderFoodSellerBaiDuMapCell alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 200*320/screenWidth)];
//            
//            CLLocationCoordinate2D  coordinate = CLLocationCoordinate2DMake(shopInfoModel.lat, shopInfoModel.lng);
//            mapCell.annotationCoordinate = coordinate;
//            return mapCell;
        }
        
    }
    else
    {
        ELeMeOrderPageRightVCCommentCell *commentCell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
        commentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        commentCell.nameStr = @"张哈哈";
        commentCell.commentScore = @"3.7";
        commentCell.dateStr = @"2016-03-13";
        commentCell.commentStr = @"太棒了，送货速度很快，饭也很美味，很棒，很喜欢，还送了一碗辣椒，超赞";
        return commentCell;
        
    }
}
//row高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight;
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
                rowHeight = 90;
                break;
            case 1:
                rowHeight = UITableViewAutomaticDimension;
                break;
            case 2:
                rowHeight = 40;
                break;
            case 3:
                rowHeight = 40;
                break;
            case 4:
                rowHeight = 200*320/ScreenWidth;
                break;
                
            default:
                rowHeight = 100;
                break;
        }
        
        
    }
    else
    {
        rowHeight = 100;
    }
    return rowHeight;
}

//分区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat headerHeight;
    return headerHeight;
}
//分区脚高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat footerHeight;
    return footerHeight;
}


@end
