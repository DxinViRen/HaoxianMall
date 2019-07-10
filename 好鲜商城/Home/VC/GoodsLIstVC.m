//
//  GoodsLIstVC.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/2.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "GoodsLIstVC.h"
#import "GooddModel.h"
#import "SectionSeporModel.h"
#import "GoodDetaiCell.h"
#import "GoodLIstItemCell.h"
#import "GoodsDetailVC.h"
@interface GoodsLIstVC ()
@property (nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation GoodsLIstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.adapter reloadDataWithCompletion:nil];
    [self configDataSource];
    NSArray *arr = @[@"新鲜水果",@"新鲜蔬菜",@"限时打折",@"特价水果"];
    self.navigationItem.title = arr[self.tag];
}

- (void)configDataSource
{
    if(self.dataSourceName.length>0)
    {
        NSMutableArray *itemArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.dataSourceName ofType:@"plist"]];
        NSMutableArray *cellItemArray = [[NSMutableArray alloc]init];
        for (NSDictionary *item in itemArray) {
            GooddModel *modle = [GooddModel  mj_objectWithKeyValues:item];
            modle.cellName = NSStringFromClass([GoodLIstItemCell class]);
            modle.cellWight = ScrW;
            modle.cellHeight = 120.0f;
            [cellItemArray addObject:modle];
        }
        SectionSeporModel *secModel = [[SectionSeporModel alloc]initWithArray:cellItemArray];
        self.dataArray = [NSMutableArray arrayWithObjects:secModel, nil];
    }
    else
    {
        self.dataArray = [[NSMutableArray alloc]init];
    }
   
    [self.adapter reloadDataWithCompletion:nil];
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
         Dx_SectionController * dxs = [[Dx_SectionController alloc]init];
        dxs.configCellBlock = ^(id  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        };
        @WeakObj(self);
        dxs.cellDidClickBlock = ^(id  _Nonnull model, NSInteger index) {
            GoodsDetailVC *dev = [[GoodsDetailVC alloc]init];
            dev.model = [model copy];
            [selfWeak.navigationController pushViewController:dev animated:YES];
        };
        return  dxs;
    }
    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
