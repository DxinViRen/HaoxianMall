//
//  MessageVC.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/10.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "MessageVC.h"
#import "GetImageCell.h"
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
}


- (void)configCell
{
    GooddModel *model = [[GooddModel alloc]init];
    model.cellName = NSStringFromClass([GetImageCell class]);
    model.cellWight  = ScrW;
    model.cellHeight = 180;
    SectionSeporModel  *secmodel = [[SectionSeporModel alloc]init];
    NSMutableArray *cellarr = [NSMutableArray arrayWithObjects:model, nil];
    secmodel.dataArray = cellarr;
    NSMutableArray *secData = [NSMutableArray arrayWithObjects:secmodel, nil];
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
    Dx_SectionController *dxs = [[Dx_SectionController alloc]init];
    dxs.cellDidClickBlock = ^(id  _Nonnull model, NSInteger index) {
        
    };
    dxs.configCellBlock = ^(id  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        
    };
    return dxs;
}

@end
