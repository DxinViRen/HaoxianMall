//
//  HoScrollCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "HoScrollCell.h"
#import "HomeCellModel.h"
#import "GooddModel.h"
@interface HoScrollCell ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *mainScrollView;
@property(nonatomic,strong)NSMutableArray * ar;

@end



@implementation HoScrollCell
@synthesize    topSeptemporView;
@synthesize    downSeptempor;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.mainScrollView];
         self.ar  = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    @WeakObj(self);
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(selfWeak);
    }];
}

- (void)setModel:(id<HomeCellModelProtocol>)model
{
    _model = model;
    NSArray *imageArray = _model.extra[kHomeSCImageArrayKey];
    NSArray *nameArr = @[@"上好大蒜，不新鲜不要钱",@"刚摘南瓜，现摘现卖",@"新鲜红薯，好吃到爆",@"柿子已经熟透可直接食用",@"新鲜红辣椒，辣到爆炸",@"产自自然茄子，纯天然无农药"];
    NSArray *imgA =  @[@"dasuan",@"nangua",@"hongshu",@"shizi",@"lajiao",@"qiezi"];
    if(imageArray.count>0)
    {
        CGFloat space = 10.0f;
        CGFloat w = (self.frame.size.width - 20)/3.0f;
        CGFloat h = self.frame.size.height;
        for (int i = 0; i<imageArray.count; i++) {
            GooddModel *model = [[GooddModel alloc]init];
            model.goodName =nameArr[i];
            model.praice = @"34";
            model.goodPrNum = @"68";
            model.imageName = imgA[i];
            model.goodDetail = @"暂无该商品的信息";
            UIButton *btn = [[UIButton alloc]init];
            btn.tag = i;
            [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnAtion:) forControlEvents:UIControlEventTouchUpInside];
            btn.frame = CGRectMake(i *(space + w), 0, w, h);
            [self.mainScrollView addSubview:btn];
            [self.ar addObject:model];
        }
    }
    
}

- (void)btnAtion:(UIButton *)sender
{
    NSLog(@"点击");
  
    [[NSNotificationCenter defaultCenter]postNotificationName:@"btntag" object:nil userInfo:@{@"tag":@(sender.tag),@"model":self.ar[sender.tag]}];
}

- (UIScrollView *)mainScrollView
{
    if(!_mainScrollView)
    {
        _mainScrollView = [[UIScrollView alloc]init];
        _mainScrollView.delegate = self;
        _mainScrollView.bounces = YES;
        _mainScrollView.contentSize = CGSizeMake(self.frame.size.width * 2, self.frame.size.height);
    }
    return _mainScrollView;
}
@end
