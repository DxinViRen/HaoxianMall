//
//  ListItemCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/10.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "ListItemCell.h"


@interface ListItemCell ()
@property (nonatomic,strong)UILabel *dTitileLabel;
@property (nonatomic,strong)UIView  *downLineView;
@end







@implementation ListItemCell
@synthesize topSeptemporView;
@synthesize downSeptempor;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setuoUI];
    }
    return self;
}


- (void)setModel:(GooddModel *)model
{
    _model = model;
    self.dTitileLabel.text = model.goodName;
}
- (void)setuoUI
{
    [self.contentView addSubview:self.dTitileLabel];
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.downLineView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.dTitileLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(15.0f);
        make.height.mas_equalTo(20.0f);
    }];
    
    [self.downLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
        make.right.equalTo(self.contentView);
    }];
}

- (UILabel *)dTitileLabel
{
    if(!_dTitileLabel)
    {
        _dTitileLabel = [[UILabel alloc]init];
        _dTitileLabel.text = @"";
        _dTitileLabel.textColor = [UIColor colorWithHexString:@"#444444"];
        _dTitileLabel.textAlignment =  NSTextAlignmentLeft;
        _dTitileLabel.font = [UIFont fontWithName:ThemeFont size:15];
        [_dTitileLabel sizeToFit];
    }
    return _dTitileLabel;
}

- (UIView *)downLineView
{
    if(!_downLineView)
    {
        _downLineView = [[UIView alloc]init];
        _downLineView.backgroundColor = [UIColor colorWithHexString:@"999999"];

    }
    return _downLineView;
}
@end
