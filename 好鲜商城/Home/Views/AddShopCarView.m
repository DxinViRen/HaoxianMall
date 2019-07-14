//
//  AddShopCarView.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/2.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "AddShopCarView.h"


@interface AddShopCarView ()
@property (nonatomic,strong)UIButton *likeBtn;
@property (nonatomic,strong)UIButton *addShopBtn;

@end

@implementation AddShopCarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
        
        [self showView];
    }
    return self;
}


- (void)setupUI
{
    [self addSubview:self.likeBtn];
    [self addSubview:self.addShopBtn];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.equalTo(self);
        make.right.equalTo(self.addShopBtn.mas_left);
        make.width.equalTo(self.addShopBtn);
    }];
    
    [self.addShopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(self);
        make.left.equalTo(self.likeBtn.mas_right);
        make.width.equalTo(self.likeBtn);
        make.top.and.bottom.equalTo(self);
    }];
}

- (UIButton *)addShopBtn
{
    if(!_addShopBtn)
    {
        _addShopBtn = [[UIButton alloc]init];
        [_addShopBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        _addShopBtn.titleLabel.font = [UIFont fontWithName:ThemeFont size:15];
        [_addShopBtn addTarget:self action:@selector(addShopAction:) forControlEvents:UIControlEventTouchUpInside];
        [_addShopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _addShopBtn.backgroundColor = [UIColor colorWithHexString:@"#f26343"];
    }
    return _addShopBtn;
}

- (UIButton *)likeBtn
{
    if(!_likeBtn)
    {
        _likeBtn =[[UIButton alloc]init];
        _likeBtn.titleLabel.font = [UIFont fontWithName:ThemeFont size:15];
        [_likeBtn setTitle:@"查看购物车" forState:UIControlStateNormal];
        [_likeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_likeBtn addTarget:self action:@selector(likeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn;
}

- (void)likeBtnAction:(UIButton *)btn
{
    //点击收藏
    if(self.lookOverBlock)
    {
        self.lookOverBlock();
    }
}


- (void)addShopAction:(UIButton *)btn
{
   //假如购物车
    if(self.adShopBlock)
    {
        self.adShopBlock();
    }
}


- (void)dissMissView
{
    [self removeFromSuperview];
    
}

- (void)showView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UITabBarController *tbc = (UITabBarController *) window.rootViewController;
    self.frame = CGRectMake(0,tbc.tabBar.frame.origin.y - 50.0f , ScrW, 50.0f);
    self.backgroundColor  = [UIColor lightGrayColor];
    [window addSubview:self];
}

@end
