//
//  UserInfoViewController.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/28.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "UserInfoViewController.h"
#import "GooddModel.h"
#import "UserHeadCell.h"
#import "ListItemCell.h"
@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configDataSource];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    self.mainCollectionView.backgroundColor = [UIColor clearColor];
}


- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    Dx_SectionController *dxs = [[Dx_SectionController alloc]init];
    dxs.configCellBlock = ^(id  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        
    };
    dxs.cellDidClickBlock = ^(id  _Nonnull model, NSInteger index) {
        
    };
    
    return dxs;
}

- (void)configDataSource
{
    GooddModel *headmodel = [[GooddModel alloc]init];
    headmodel.cellName = NSStringFromClass([UserHeadCell class]);
    headmodel.cellWight = ScrW;
    headmodel.cellHeight = 220;
    
    
    
    GooddModel *itemmodel = [[GooddModel alloc]init];
    itemmodel.cellName = NSStringFromClass([ListItemCell class]);
    itemmodel.cellWight = ScrW;
    itemmodel.goodName = @"客服电话:0632-5020183";
    itemmodel.cellHeight = 55;
    
    
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:itemmodel, nil];
    SectionSeporModel *secMOdel2 = [[SectionSeporModel alloc]initWithArray:arr2];
    
    
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:headmodel,nil];
    SectionSeporModel *model = [[SectionSeporModel alloc]initWithArray:arr];
    NSMutableArray *secarr  = [[NSMutableArray alloc]initWithObjects:model,secMOdel2, nil];
    self.dataArray = secarr;
    [self.adapter reloadDataWithCompletion:nil];
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
