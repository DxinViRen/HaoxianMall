//
//  MakeupCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/10.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "MakeupCell.h"

NSString *const NoitificationMakeUpOrder  = @"NoitificationMakeUpOrder";
@interface MakeupCell ()
@property (nonatomic,strong)UIButton *makeBtn; //确定按钮

@end



@implementation MakeupCell
@synthesize topSeptemporView;
@synthesize downSeptempor;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self.contentView addSubview:self.makeBtn];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.makeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).inset(20);
        make.height.mas_equalTo(50);
    }];
}

- (UIButton *)makeBtn
{
    if(!_makeBtn)
    {
        _makeBtn  = [[UIButton alloc]init];
        [_makeBtn setTitle:@"提交订单" forState:UIControlStateNormal];
        [_makeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _makeBtn.titleLabel.font  = [UIFont fontWithName:ThemeFont size:15];
        _makeBtn.backgroundColor = [UIColor redColor];
        _makeBtn.layer.cornerRadius = 3;
        [_makeBtn addTarget:self action:@selector(makeupOrder:) forControlEvents:UIControlEventTouchUpInside];
        _makeBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _makeBtn.layer.borderWidth = 0.5;
    }
    return _makeBtn;
}

- (void)makeupOrder:(UIButton *)btn
{
    [[NSNotificationCenter defaultCenter]postNotificationName:NoitificationMakeUpOrder  object:nil];
}
@end
