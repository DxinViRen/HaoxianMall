//
//  JieSuanViewController.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/8.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "JieSuanViewController.h"
#import "HomeCellModel.h"
#import "AllPriceCell.h"
#import "GetGoodsAdressCell.h"
#import "GoodLIstItemCell.h"
#import "OrderDetailCell.h"
#import "MakeupCell.h"
#import "MessageVC.h"
@interface JieSuanViewController ()<TextFiledActionDelegate>
@property (nonatomic,copy)NSString *connect;
@property (nonatomic,copy)NSString *adress;
@end

@implementation JieSuanViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configData];
    self.navigationItem.hidesBackButton = YES;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(makeupOrderAction:) name:NoitificationMakeUpOrder object:nil];
    self.connect = nil;
    self.adress = nil;
    self.title = @"订单";
    UIButton *cancel = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [cancel setTitle:@"取消订单" forState:UIControlStateNormal];
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

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    Dx_SectionController *dxs = [[Dx_SectionController alloc]init];
    dxs.configCellBlock = ^(id  _Nonnull model, NSInteger index, UICollectionViewCell * _Nonnull cell) {
        if(index == 1 ||index == 2)
        {
           
            GetGoodsAdressCell *getCell = (GetGoodsAdressCell *)cell;
            getCell.delegate = self;
            if(index == 1)
            {
                getCell.adressssTextField.tag = 100;
            }
            else
            {
                getCell.adressssTextField.tag = 200;
            }
        }
    };
    
    dxs.cellDidClickBlock = ^(id  _Nonnull model, NSInteger index) {
        
    };
    
    return dxs;
}

- (void)makeupOrderAction:(NSNotification *)noti
{
    if(self.connect.length == 0||self.adress.length == 0)
    {
        UIAlertController *ael = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请填写完整信息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alac = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [ael addAction:alac];
        [self presentViewController:ael animated:YES completion:nil];
    }
    else
    {
        MessageVC *mgc = [[MessageVC alloc]init];
        [self.navigationController pushViewController:mgc animated:YES];
        
    }
    
}

#pragma mark - configData
- (void)configData
{
    CGFloat total = 0;
    for (GooddModel *model in self.checkArray) {
        total += [model.praice floatValue] *model.goodNum;
    }
    
    GooddModel *cellModel = [[GooddModel alloc]init];
    cellModel.cellName = NSStringFromClass([AllPriceCell class]);
    cellModel.cellWight = ScrW;
    cellModel.cellHeight = 50;
    cellModel.goodName = @"总价：";
    cellModel.praice = [NSString stringWithFormat:@"%.2f元",total];
    
    
    GooddModel *adressModel = [[GooddModel alloc]init];
    adressModel.cellName = NSStringFromClass([GetGoodsAdressCell class]);
    adressModel.cellWight = ScrW;
    adressModel.cellHeight = 50;
    adressModel.goodName = @"送货地址:";
    adressModel.imageName = @"请输入您的收货地址";
    
    GooddModel *conModel = [[GooddModel alloc]init];
    conModel.cellName = NSStringFromClass([GetGoodsAdressCell class]);
    conModel.cellWight = ScrW;
    conModel.cellHeight = 50;
    conModel.goodName = @"联系方式:";
    conModel.imageName = @"请输入您的联系方式";
    
    
    
    GooddModel *payModel = [[GooddModel alloc]init];
    payModel.cellName = NSStringFromClass([AllPriceCell class]);
    payModel.cellWight = ScrW;
    payModel.cellHeight = 50;
    payModel.goodName = @"付款方式:";
    payModel.praice = @"当面交易，货到付款";
    
    
    GooddModel *makeModel = [[GooddModel alloc]init];
    makeModel.cellName = NSStringFromClass([MakeupCell class]);
    makeModel.cellWight = ScrW;
    makeModel.cellHeight = 80;

    
    
    SectionSeporModel *secModel = [[SectionSeporModel alloc]init];
    secModel.dataArray = [NSMutableArray arrayWithObjects:cellModel,adressModel,conModel,payModel, nil];
    for (GooddModel *model in self.checkArray) {
        GooddModel *cModel = [model copy];
        cModel.cellHeight = 100.0f;
        cModel.cellName = NSStringFromClass([OrderDetailCell class]);
        [secModel.dataArray addObject:cModel];
    }
    [secModel.dataArray addObject:makeModel];
    self.dataArray = [NSMutableArray arrayWithObjects:secModel, nil];
    [self.adapter reloadDataWithCompletion:nil];
    
}


#pragma mark - TextFieldActionDeleigate
- (void)textFieldOptionWithTextFiled:(UITextField *)textField
{
    if(textField.tag == 100)
    {
        //地址
        self.adress = textField.text;
    }
    else
    {
        //联系方式
        self.connect = textField.text;
    }
}

@end
