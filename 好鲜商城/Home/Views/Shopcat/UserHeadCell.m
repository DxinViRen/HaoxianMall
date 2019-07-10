//
//  UserHeadCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/10.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "UserHeadCell.h"

@interface UserHeadCell ()
@property (nonatomic,strong)UIImageView *backImageView;
@property (nonatomic,strong)UILabel *userNameLabel;
@property (nonatomic,strong)UIImageView *headImageView;

@end



@implementation UserHeadCell
@synthesize downSeptempor;
@synthesize topSeptemporView;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    [self.contentView addSubview:self.backImageView];
    [self.backImageView addSubview:self.headImageView];
    [self.backImageView addSubview:self.userNameLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backImageView).inset(20.0f);
        make.centerY.equalTo(self.backImageView);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(10.0f);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(20);
    }];
    
}

- (void)setModel:(GooddModel *)model
{
    _model = model;
}

- (UIImageView *)backImageView
{
    if(!_backImageView)
    {
        _backImageView = [[UIImageView alloc]init];
        _backImageView.image = [UIImage imageNamed:@"minehead"];
    }
    return _backImageView;
}

- (UILabel *)userNameLabel
{
    if(!_userNameLabel)
    {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = [UIFont fontWithName:ThemeFont size:15];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        _userNameLabel.text  =@"爱背单词的司马惜梦";
        _userNameLabel.textColor = [UIColor whiteColor];
        [_userNameLabel sizeToFit];
    }
    return _userNameLabel;
}

- (UIImageView *)headImageView
{
    if(!_headImageView)
    {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image =[UIImage imageNamed:@"qiandao"];
        _headImageView.layer.cornerRadius = 40;
        _headImageView.backgroundColor = [UIColor redColor];
        _headImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _headImageView.layer.borderWidth = 4;
    }
    return _headImageView;
}


@end
