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
#import "AboutUsVC.h"
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
    NSInteger sec = [self.dataArray indexOfObject:object];
    dxs.configCellBlock = ^(id  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        
    };
    dxs.cellDidClickBlock = ^(id  _Nonnull model, NSInteger index) {
        if(sec == 1)
        {
            if(index == 0)
            {
                //客服电话
                NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"06325020183"];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
                
            }
            else if (index == 1)
            {
                //关于我们
                AboutUsVC *abc = [[AboutUsVC alloc]init];
                [self.navigationController pushViewController:abc animated:YES];
            }
        }
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
    
    GooddModel *itemmodel2 = [[GooddModel alloc]init];
    itemmodel2.cellName = NSStringFromClass([ListItemCell class]);
    itemmodel2.cellWight = ScrW;
    itemmodel2.goodName = @"关于我们";
    itemmodel2.cellHeight = 55;
    
    
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:itemmodel, itemmodel2,nil];
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
