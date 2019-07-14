//
//  HomeViewController.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/28.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "HomeViewController.h"
#import "Dx_SectionController.h"
#import "HomeBannerCell.h"
#import "HomeMenuCell.h"
#import "HoScrollCell.h"
#import "HomeSCHeadCell.h"
#import "HomeIndexModel.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "GoodsDetailVC.h"
#import "GooddModel.h"
#import "GoodsLIstVC.h"
#import "LoginViewController.h"
@interface HomeViewController ()
@property (nonatomic,strong)NSArray *goodListDataSoureArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainCollectionView.showsVerticalScrollIndicator = NO;
    self.dataArray = [HomeIndexModel createDataArray];
    [self.adapter reloadDataWithCompletion:nil];
    self.goodListDataSoureArray = @[@"xinxianshuiguo",@"xinxianshucai",@"xianshidazhe",@"xinxianshuiguo"];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(itemClick:) name:@"tag" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrClick:) name:@"btntag" object:nil];
    self.view.backgroundColor  = [UIColor colorWithHexString:@"#F8F8F8"];
}


- (void)scrClick:(NSNotification *)noti
{
    NSDictionary *dic = noti.userInfo;
    GoodsDetailVC *det = [[GoodsDetailVC alloc]init];
    det.model = dic[@"model"];
    [self.navigationController pushViewController:det animated:YES];
}

- (void)itemClick:(NSNotification *)noti
{
    NSString *tag = noti.userInfo[@"tag"];
    GoodsLIstVC *vs = [[GoodsLIstVC alloc]init];
    vs.dataSourceName = self.goodListDataSoureArray[[tag integerValue]];
    vs.tag = [tag integerValue];
    [self.navigationController pushViewController:vs animated:YES];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


#pragma mark - IGListDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    if([object isKindOfClass:[SectionSeporModel class]])
    {
        Dx_SectionController *dxs = [[Dx_SectionController alloc]init];
        NSInteger section = [self.dataArray indexOfObject:object];
        @WeakObj(self);
        dxs.cellDidClickBlock = ^(id  _Nonnull model, NSInteger index) {
            [selfWeak clickCellSection:section model:model index:index];
        };
        return dxs;
    }
    return nil;
}

#pragma mark - private method
- (void)clickCellSection:(NSInteger)sec model:(id)model index:(NSInteger)index
{
   if(sec == 1)
   {
       GoodsDetailVC *detai = [[GoodsDetailVC alloc]init];
       detai.model = [model copy];
       [self.navigationController pushViewController:detai animated:YES];
   }
}



@end
