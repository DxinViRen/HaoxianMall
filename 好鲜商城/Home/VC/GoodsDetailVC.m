//
//  GoodsDetailVC.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/1.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "GoodsDetailVC.h"
#import "SectionSeporModel.h"
#import "GooddModel.h"
#import "GoodDetailCell.h"
#import "AddShopCarView.h"
#import "GoodDetailCell.h"
#import "GoodDetaiCell.h"
#import "shopCatVC.h"
@interface GoodsDetailVC ()
@property (nonatomic,strong)NSString *addShopvView;
@property (nonatomic,strong)AddShopCarView *adsView;
@end

@implementation GoodsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    [self configDataSource];
    [self.adapter reloadDataWithCompletion:nil];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.title = @"商品详情";
    [self adsView];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    [self.adsView showView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
   
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    
}

- (void)configDataSource
{
    GooddModel *model0 = self.model;
    model0.cellName  = NSStringFromClass([GoodDetailCell class]);
    model0.cellHeight = 400.0f;
    
    GooddModel *mode1 = [GooddModel alloc];
    mode1.cellName = NSStringFromClass([GoodDetaiCell class]);
    mode1.cellHeight = 400;
    mode1.cellWight = ScrW;
    mode1.goodDetail = self.model.goodDetail;
    NSMutableArray * arr = [NSMutableArray arrayWithObjects:model0,mode1, nil];
    
    SectionSeporModel *secModel = [[SectionSeporModel alloc]initWithArray:arr];
    self.dataArray = [NSMutableArray arrayWithObjects:secModel, nil];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    if([object isKindOfClass:[SectionSeporModel class]])
    {
        Dx_SectionController *dxs = [[Dx_SectionController alloc]init];
        dxs.configCellBlock = ^(id  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        };
        dxs.cellDidClickBlock = ^(id  _Nonnull model, NSInteger index) {
        };
        return dxs;
    }
    
    return nil;
}


- (AddShopCarView *)adsView
{
    if(!_adsView)
    {
        @WeakObj(self);
        _adsView = [[AddShopCarView alloc]init];
        _adsView.adShopBlock = ^{
            [selfWeak addGoodToCatWithData:selfWeak.model];
        };
        _adsView.lookOverBlock = ^{
            shopCatVC *shov  = [[shopCatVC alloc]init];
            [selfWeak.navigationController pushViewController:shov animated:YES];
        };
    }
    
    return _adsView;
}


#pragma mark -假如购物车操作
- (void)addGoodToCatWithData:(GooddModel *)model
{
  //存入userDefaults
    NSMutableArray *arr = [[[NSUserDefaults standardUserDefaults] objectForKey:ADDTOSHOPCAT] mutableCopy] ;
    if(!arr)arr = [@[] mutableCopy];
    NSDictionary *dic = model.mj_keyValues;
    [arr addObject:dic];
    [[NSUserDefaults standardUserDefaults]setObject:arr forKey:ADDTOSHOPCAT];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    UIAlertController *alvc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"加入购物车成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alaction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alvc dismissViewControllerAnimated:YES completion:nil];
    }];
    [alvc addAction:alaction];
    [self presentViewController:alvc animated:YES completion:nil];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.adsView dissMissView];
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
