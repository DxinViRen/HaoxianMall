//
//  shopCatVC.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/5.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "shopCatVC.h"
#import "GooddModel.h"
#import "ShopCatCell.h"
#import "ShopCatCell.h"
#import "GoodsDetailVC.h"
#import "ShopCatOptionView.h"
#import "JieSuanViewController.h"
#define shopCat  @"ShopList"

@interface shopCatVC ()<shopCarOptionDelegate,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic,strong)ShopCatOptionView *shOpView;
@end

@implementation shopCatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configData];
    self.title = @"购物车";
    self.mainCollectionView.emptyDataSetSource = self;
    self.mainCollectionView.emptyDataSetDelegate = self;
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    [win addSubview:self.shOpView];
    [self.shOpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(win);
        make.bottom.equalTo(win).inset(self.tabBarController.tabBar.frame.size.height);
        make.height.mas_equalTo(50.0f);
    }];
    [self setNavigationBar];
    
}


//设置navigation
- (void)setNavigationBar
{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    [btn setTitle:@"删除" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(deleteGoods:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem =rightItem;
}

- (void)deleteGoods:(UIButton *)btn
{
    SectionSeporModel *secmodel = self.dataArray[0];
    NSMutableArray *goodArray = secmodel.dataArray;
    NSMutableArray *cellA = [@[] mutableCopy];
    NSMutableArray *goodDic =[@[] mutableCopy];
    for (GooddModel *model in goodArray) {
        if(model.isCheck){
            [cellA addObject:model];
        }
    }
    
    if(cellA.count == 0){
        UIAlertController *uiac = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您没有勾选任何商品" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [uiac addAction:alAction];
        [self presentViewController:uiac animated:YES completion:nil];
    }
    [goodArray removeObjectsInArray:cellA];
    for (GooddModel *model in goodArray) {
        NSDictionary *dic = model.mj_keyValues;
        [goodDic addObject:dic];
    }
    
    [[NSUserDefaults standardUserDefaults]setObject:goodDic forKey:ADDTOSHOPCAT];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self.adapter reloadDataWithCompletion:^(BOOL finished) {
        if(goodArray.count == 0){
            self.shOpView.hidden = YES;
            [self cancelAllCheck];
        }
    }];
}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView
{
    UIView *view = [[UIView alloc]init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(300);
    }];
    
    UIImageView *mainImageView = [[UIImageView alloc]init];
    mainImageView.image = [UIImage imageNamed:@"shopCartkong"];
    [view addSubview:mainImageView];
    [mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).inset(20);
        make.centerX.equalTo(view);
        make.size.mas_equalTo(CGSizeMake(176, 160));
    }];
   
    UILabel *label = [[UILabel alloc]init];
    label.font  = [UIFont fontWithName:ThemeFont size:15];
    label.text = @"您的购物车空空如也，快去添加商品吧";
    label.textColor = [UIColor colorWithHexString:@"#999999"];
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mainImageView.mas_bottom).offset(15);
        make.height.mas_equalTo(20);
        make.centerX.equalTo(view);
    }];
    return view;
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mainCollectionView.frame = CGRectMake(0, 0,ScrW, self.view.frame.size.height  - 50);
    [self.view addSubview:self.mainCollectionView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.adapter reloadDataWithCompletion:nil];
    [self setShopOpViewPrice];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self configData];
    [self configOptionViewHidden];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.shOpView.hidden = YES;
}
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    @WeakObj(self);
    Dx_SectionController *dxc = [[Dx_SectionController alloc]init];
    //NSInteger section  = [self.dataArray indexOfObject:object];
    dxc.configCellBlock = ^(id  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        ShopCatCell *shopCell = (ShopCatCell *)cell;
        shopCell.opBlock = ^(NSInteger num, OpNumViw * _Nonnull opView) {
            //Num是实时数字显示
                GooddModel *goodModle = model;
                goodModle.goodNum = num;
                [selfWeak setShopOpViewPrice];
        };
        shopCell.checkBlock = ^(UICollectionViewCell * _Nonnull cell, GooddModel * _Nonnull model) {
            //点击，控制显示LAbel价格
            //如果全部选中，置为取消全选
             [selfWeak isAllCheck]?[selfWeak setAllCheck]:[selfWeak cancelAllCheck];
             [selfWeak setShopOpViewPrice];
        };
    };
    
    dxc.cellDidClickBlock = ^(id  _Nonnull model, NSInteger index) {
        GoodsDetailVC *dvc  = [[GoodsDetailVC alloc]init];
        dvc.model = [model copy];
        [selfWeak.navigationController pushViewController:dvc animated:YES];
        
    };
    
    return dxc;
}


#pragma mark - 底部OptionView 的c显示隐藏
- (void)configOptionViewHidden
{
    SectionSeporModel *model= self.dataArray[0];
    self.shOpView.hidden = model.dataArray.count==0;
}

//置全选
- (void)setAllCheck
{
    [self.shOpView.allSelectBtn setTitle:@"取消全选" forState:UIControlStateNormal];
    self.shOpView.isAllSelect = YES;
}

//取消全选
- (void)cancelAllCheck
{
    [self.shOpView.allSelectBtn setTitle:@"全选" forState:UIControlStateNormal];
    self.shOpView.isAllSelect = NO;
}


//判断当前是否全选
- (BOOL)isAllCheck
{
    SectionSeporModel *sectionModel = self.dataArray[0];
    NSArray * goodArr = sectionModel.dataArray;
    NSInteger checkInter = 0;
    for (GooddModel *goodModel in goodArr) {
        if(goodModel.isCheck) checkInter++;
    }
    return checkInter == goodArr.count;
}


- (void)configData
{
    NSArray *itemArray = [[NSUserDefaults standardUserDefaults] objectForKey:ADDTOSHOPCAT];
    NSMutableArray* cellArr = [@[] mutableCopy];
    for (NSDictionary *item in itemArray) {
        GooddModel *model = [GooddModel mj_objectWithKeyValues:item];
        model.cellName = NSStringFromClass([ShopCatCell class]);
        model.cellHeight = 100;
        model.cellWight = ScrW;
        [cellArr addObject:model];
    }
    SectionSeporModel *secModel = [[SectionSeporModel alloc]initWithArray:cellArr];
    self.dataArray  = [NSMutableArray arrayWithObjects:secModel, nil];
    [self.adapter reloadDataWithCompletion:^(BOOL finished) {
        self.shOpView.hidden = cellArr.count == 0;
    }];
}
    

- (ShopCatOptionView *)shOpView
{
    if(!_shOpView)
    {
        _shOpView = [[ShopCatOptionView alloc]init];
        _shOpView.delegate = self;
    }
    return _shOpView;
}

#pragma mark - 计算价格
- (CGFloat)caluPrice
{
    SectionSeporModel *secModel = self.dataArray[0];
    NSArray *cellArr = secModel.dataArray;
    CGFloat price = 0;
    for (GooddModel *model in cellArr) {
        if(model.isCheck)
        {
            CGFloat num = model.goodNum;
            CGFloat mprice = [model.praice floatValue];
            CGFloat tota = num * mprice;
            price += tota;
        }
    }
    return price;
}

- (void)setShopOpViewPrice
{
    CGFloat tot = [self caluPrice];
    self.shOpView.currentBill.text = [NSString stringWithFormat:@"￥%.2f",tot];
}

#pragma mark - shopCarOptionDelegate
- (void)shopCarAllSelectWithView:(ShopCatOptionView *)shoView
{
    //全选
    SectionSeporModel *secModel = self.dataArray[0];
    for (GooddModel *mode in secModel.dataArray) {
        mode.isCheck  = YES;
    }
    [self.adapter reloadDataWithCompletion:nil];
    [self setShopOpViewPrice];
}

#pragma mark - 查找选中
- (NSArray *)checkModelArray
{
    SectionSeporModel *secModel = self.dataArray[0];
    NSMutableArray *checkCell = [@[] mutableCopy];
    NSArray *cellArr = secModel.dataArray;
    for (GooddModel *model in cellArr) {
        if(model.isCheck)
        {
            [checkCell addObject:model];
        }
    }
    return checkCell;
}
- (void)shopCarJiesuanWithView:(ShopCatOptionView *)view
{
    if([self checkModelArray].count == 0)
    {
        //提示没有商品
        UIAlertController *alc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您没有勾选任何商品" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alc addAction:ac];
        [self presentViewController:alc animated:YES completion:nil];
        return;
    }
    //结算
    JieSuanViewController *ji = [[JieSuanViewController alloc]init];
    ji.checkArray = [self checkModelArray];
    [self.navigationController pushViewController:ji animated:YES];
    [self deleteGoodsWithArray:[self checkModelArray]];
}

- (void)deleteGoodsWithArray:(NSArray *)arr
{
    NSMutableArray *itemArr = [[[NSUserDefaults standardUserDefaults]objectForKey:ADDTOSHOPCAT] mutableCopy];
    NSMutableArray *mArr = [@[] mutableCopy];
    [itemArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GooddModel *model =[GooddModel mj_objectWithKeyValues:obj];
        for (GooddModel *gmo in arr) {
            if(model.goodName == gmo.goodName)
            {
                [mArr addObject:obj];
            }
        }
    }];
    [itemArr removeObjectsInArray:mArr];
    [[NSUserDefaults standardUserDefaults]setObject:[itemArr copy] forKey:ADDTOSHOPCAT];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)cancelAllSelectWithView:(ShopCatOptionView *)view
{
    //取消全选
    SectionSeporModel *secModel = self.dataArray[0];
    for (GooddModel *mode in secModel.dataArray) {
        mode.isCheck  = NO;
    }
    [self.adapter reloadDataWithCompletion:nil];
    [self setShopOpViewPrice];
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
