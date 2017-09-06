//
//  ELeMeOrderPageLeftViewController.m
//  ELeMe_OrderPage
//
//  Created by liyifang on 2017/7/12.
//  Copyright © 2017年 liyifang. All rights reserved.
//

#import "ELeMeOrderPageLeftViewController.h"
#import "ELeMeOrderPageViewMainController.h"
#import "ELeMeOrderPageLeftVCCell.h"
#import "Header.h"
@interface ELeMeOrderPageLeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)LWGesturePenetrationTableView *rightTableView;
@property(nonatomic, strong)UITableView *leftTableView;
@end

@implementation ELeMeOrderPageLeftViewController
{
    BOOL _rightTVScrollUp;
    BOOL _rightTVScrollDown;
    CGFloat _oldRightOffsetY;
    BOOL _didSelectLeftTVCell;//选中左边tableView cell
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self putTogetheraddSubViews];
}

#pragma mark --- UI ---
/**
 组装视图
 */
-(void)putTogetheraddSubViews
{
   __weak __typeof(self) weekSelf = self;
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    self.leftTableView.backgroundColor = [UIColor greenColor];
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(90);
    }];
    [self.rightTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(weekSelf.leftTableView.mas_right).with.offset(0);
        make.right.mas_equalTo(0);
    }];
}
#pragma mark - UI懒加载
-(LWGesturePenetrationTableView *)rightTableView
{
    if (!_rightTableView) {
        _rightTableView = [[LWGesturePenetrationTableView alloc]init];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        
        [_rightTableView registerClass:[ELeMeOrderPageLeftVCRightCell class] forCellReuseIdentifier:@"cell2"];
    }
    return _rightTableView;
}

-(UITableView *)leftTableView
{
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc]init];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        
        [_leftTableView registerClass:[ELeMeOrderPageLeftVCLeftCell class] forCellReuseIdentifier:@"cell1"];
    }
    return _leftTableView;
}
#pragma mark --- set ---
-(void)setOrderFoodModel:(OrderFoodModel *)orderFoodModel
{
    _orderFoodModel = orderFoodModel;
    [self.rightTableView reloadData];
    [self.leftTableView reloadData];
    if (_orderFoodModel.menuTypesModelArr.count>0) {
        NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [_leftTableView selectRowAtIndexPath:targetIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
}


#pragma mark --- UIScrollViewDelegate ---

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    ELeMeOrderPageViewMainController *vc = (ELeMeOrderPageViewMainController *)[self parentViewController];//父控制器
    if (scrollView==self.rightTableView&&!_didSelectLeftTVCell) {
        if (scrollView.contentOffset.y <= 0) {
            self.offsetType = OffsetTypeMin;
            scrollView.contentOffset = CGPointZero;
        } else {
            self.offsetType = OffsetTypeCenter;
        }
        
        if (vc.offsetType == OffsetTypeMin) {
            scrollView.contentOffset = CGPointZero;
        }
        if (vc.offsetType == OffsetTypeCenter) {
            scrollView.contentOffset = CGPointZero;
        }
        if (vc.offsetType == OffsetTypeMax) {
            
        }
        
        //联动逻辑：rightTableViews顶部section头消失出现 实现 leftTableView选择联动
        if (scrollView.contentOffset.y>_oldRightOffsetY) {
            _rightTVScrollUp = YES;
            _rightTVScrollDown =  !_rightTVScrollUp;

            
        } else if (scrollView.contentOffset.y<_oldRightOffsetY)
        {
            _rightTVScrollUp = NO;
            _rightTVScrollDown =  !_rightTVScrollUp;
        }
        _oldRightOffsetY = scrollView.contentOffset.y;
    }
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (scrollView==self.rightTableView) {
        _didSelectLeftTVCell = NO;
    }
}
//代理UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger num;
    if (tableView==self.leftTableView) {
         num = 1;
    }
    else
    {
        num = _orderFoodModel.menuTypesModelArr.count;
//        _rightSectionNum = num;
    }
        return num;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num;
    if (tableView==self.leftTableView) {
          num = _orderFoodModel.menuTypesModelArr.count;
    }
    else
    {
        OrderFoodMenuTypeModel *menuTypeModel = _orderFoodModel.menuTypesModelArr[section];
        num = menuTypeModel.menusModelArr.count;
    }
    
    return num;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak __typeof(self) weekSelf = self;
    if (tableView==self.leftTableView) {
        OrderFoodMenuTypeModel *menuType = self.orderFoodModel.menuTypesModelArr[indexPath.row];
       ELeMeOrderPageLeftVCLeftCell *leftCell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        leftCell.backgroundColor = [UIColor colorWithHexString:@"e6e6e6"];
        leftCell.text = menuType.goods_type;
        UIView *selectedBackgroundView = [[UIView alloc]init];
        UIView *lineVView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2, 48)];
        lineVView.backgroundColor = UIColor_0398ff;
        selectedBackgroundView.backgroundColor = [UIColor whiteColor];
        [selectedBackgroundView addSubview:lineVView];
        leftCell.selectedBackgroundView = selectedBackgroundView;
        return leftCell;
    }
    else
    {
        ELeMeOrderPageLeftVCRightCell *rightCell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        rightCell.isFirst = YES;
        rightCell.selectionStyle =  UITableViewCellSelectionStyleNone;
        rightCell.backgroundColor=[UIColor whiteColor];
        
        //
        OrderFoodMenuTypeModel *menuType = self.orderFoodModel.menuTypesModelArr[indexPath.section];
        __block OrderFoodMenuModel *menuModel = menuType.menusModelArr[indexPath.row];
        menuModel.indexPath = indexPath;
        //
        rightCell.goodsImgUrlStr = menuModel.pic;//商品图片视图
        rightCell.titleStr = menuModel.name;//商品标题
        rightCell.saleNumberStr = [NSString stringWithFormat:@"已售%@份",menuModel.sales]; //销量
        rightCell.priceStr =  menuModel.price;//价格
        rightCell.shopNumberStr = [NSString stringWithFormat:@"%ld",(long)menuModel.shopNum];//购买量
        
        __weak __typeof(& *rightCell) weekRightCell = rightCell;
        [rightCell clickButtonBloak:^(NSInteger shopNumChange) {
            
            
//            if (weekSelf.delegate&&[weekSelf.delegate respondsToSelector:@selector(clickAddButtonRightTableViewCell:)]) {
//                BOOL canClick =   [weekSelf.delegate clickAddButtonRightTableViewCell:rightCell];
//                if (!canClick) {
//                    return;
//                }
//                //                if (shopNumChange>0) {
//                //                    [weekSelf.delegate clickAddButtonRightTableViewCell:rightCell];
//                //                }
//                //购买数量变化
//                _orderMenuNum =  _orderMenuNum + shopNumChange;
//                //购买钱数变化
//                _totalMoney = _totalMoney +  [weekRightCell.priceStr floatValue]*shopNumChange;
//                menuModel.shopNum = menuModel.shopNum  + shopNumChange;
//                if (weekSelf.delegate&&[weekSelf.delegate respondsToSelector:@selector(shopCarOrderMenuNumChanged:changeNum:)]) {
//                    [weekSelf.delegate shopCarOrderMenuNumChanged:menuModel changeNum:shopNumChange];
//                }
//                
//                if (shopNumChange>0&&menuModel.shopNum==1) {
//                    if (!_shopCarMenuModelsArr) {
//                        _shopCarMenuModelsArr =   [NSMutableArray array];
//                    }
//                    [_shopCarMenuModelsArr addObject:menuModel];
//                }else if (shopNumChange<0&&menuModel.shopNum==0)
//                {
//                    [_shopCarMenuModelsArr removeObject:menuModel];
//                }
//                weekRightCell.shopNumberStr = [NSString stringWithFormat:@"%ld",(long)menuModel.shopNum];
//            }
        }];
        return rightCell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    if (tableView==self.rightTableView) {
        OrderFoodMenuTypeModel *menuType = self.orderFoodModel.menuTypesModelArr[section];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, ScreenWidth-10, 20)];
        [view addSubview:lable];
        lable.font = [UIFont systemFontOfSize:11];
        lable.textColor = UIColor_333333;
        lable.text = menuType.goods_type;
    }
    
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return view;
}
//行高 Footer
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = tableView == self.leftTableView ? 48 : 79;
    return rowHeight;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat headerHeight = tableView == self.rightTableView ? 20 : 0.01;
    return headerHeight;
}

#pragma mark -  leftTableView rightTableView实现联动 : rightTableViews顶部section头消失出现 实现 leftTableView选择联动
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.leftTableView) {
        [self scrollRightTableViewWhenSelectRowInLeftTableViewAtIndexPath:indexPath];
        _didSelectLeftTVCell = YES;
    }
}

-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    
    if (!_didSelectLeftTVCell&&tableView==self.rightTableView&&_rightTVScrollUp) {
        NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:section+1 inSection:0];
        if ((section+1)<_orderFoodModel.menuTypesModelArr.count) {
            [_leftTableView selectRowAtIndexPath:targetIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        }
        
    }
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
{
    if (!_didSelectLeftTVCell&&tableView==self.rightTableView&&_rightTVScrollDown) {
        NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:section inSection:0];
        [_leftTableView selectRowAtIndexPath:targetIndexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
//
}


#pragma mark -
-(void)scrollRightTableViewWhenSelectRowInLeftTableViewAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.row;
    NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:NSNotFound inSection:section];
    [_rightTableView scrollToRowAtIndexPath:targetIndexPath atScrollPosition: UITableViewScrollPositionTop animated:YES];
}

@end
