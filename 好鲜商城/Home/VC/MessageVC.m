//
//  MessageVC.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/10.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "MessageVC.h"
#import "GetImageCell.h"
#import "HomeCellModel.h"
#import "HomeSCHeadCell.h"
#import "GoodLIstItemCell.h"
#import "GoodsDetailVC.h"
#import "GoodDetaiCell.h"
@interface MessageVC ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@end

@implementation MessageVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下单成功";
    self.navigationItem.hidesBackButton = YES;
    self.mainCollectionView.emptyDataSetSource = self;
    self.mainCollectionView.emptyDataSetDelegate = self;
    [self configCell];
    
    UIButton *cancel = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [cancel setTitle:@"回到首页" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancelOrder:) forControlEvents:UIControlEventTouchUpInside];
    cancel.titleLabel.font  = [UIFont fontWithName:ThemeFont size:13];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:cancel];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)cancelOrder:(UIButton *)btn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)configCell
{
    GooddModel *model = [[GooddModel alloc]init];
    model.cellName = NSStringFromClass([GetImageCell class]);
    model.cellWight  = ScrW;
    model.cellHeight = 180;
    SectionSeporModel  *secmodel = [[SectionSeporModel alloc]init];
    
    
    HomeCellModel *headSCSCrollModel1  = [[HomeCellModel alloc]init];
    headSCSCrollModel1.cellName = NSStringFromClass([HomeSCHeadCell class]);
    headSCSCrollModel1.cellHeight = 50.0f;
    headSCSCrollModel1.extra = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"猜你喜欢",kHomeSectionHeaderDtitle ,nil];
    
    NSMutableArray *itemArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xinxianshuiguo" ofType:@"plist"]];
    NSMutableArray *cellItemArray = [[NSMutableArray alloc]init];
    for (NSDictionary *item in itemArray) {
        GooddModel *modle = [GooddModel  mj_objectWithKeyValues:item];
        modle.cellName = NSStringFromClass([GoodLIstItemCell class]);
        modle.cellWight = ScrW;
        modle.cellHeight = 120.0f;
        [cellItemArray addObject:modle];
    }
    
    SectionSeporModel *secModel = [[SectionSeporModel alloc]initWithArray:cellItemArray];
 
    NSMutableArray *cellarr = [NSMutableArray arrayWithObjects:model, headSCSCrollModel1,nil];
    secmodel.dataArray = cellarr;
    NSMutableArray *secData = [NSMutableArray arrayWithObjects:secmodel,secModel, nil];
    self.dataArray = secData;
    [self.adapter reloadDataWithCompletion:nil];
}



- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"shopCartkong"];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    return self.dataArray;
}



- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    
    NSInteger section = [self.dataArray indexOfObject:object];
    Dx_SectionController *dxs = [[Dx_SectionController alloc]init];
    dxs.cellDidClickBlock = ^(id  _Nonnull model, NSInteger index) {
        if(section == 1)
        {
            GoodsDetailVC *gdv = [[GoodsDetailVC alloc]init];
            gdv.model = [(GooddModel *)model copy];
            [self.navigationController pushViewController:gdv animated:YES];
        }
    };
    dxs.configCellBlock = ^(id  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        
    };
    return dxs;
}

@end
