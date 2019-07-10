//
//  GoodLIstItemCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/2.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "GoodLIstItemCell.h"

@interface GoodLIstItemCell ()




@end




@implementation GoodLIstItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    [self.contentView addSubview:self.dtitle];
    [self.contentView addSubview:self.leftImageView];
    [self.contentView addSubview:self.botView];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.logoLabel];
}

- (void)setModel:(GooddModel *)model
{
    _model = model;
    self.dtitle.text = _model.goodName;
    self.leftImageView.image  = [UIImage imageNamed:_model.imageName];
    self.priceLabel.text = _model.praice;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.equalTo(self.contentView).inset(15.0f);
        make.centerY.equalTo(self.contentView);
    }];
    [self.dtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageView.mas_right).offset(10.0f);
        make.right.equalTo(self.contentView).inset(10.0f);
        make.top.equalTo(self.leftImageView).offset(15);
    }];
    
    [self.botView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(125);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).inset(60.0f);
        make.bottom.equalTo(self.contentView).inset(20.0f);
        make.height.mas_equalTo(20.0f);
    }];
    
    [self.logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.priceLabel.mas_left).offset(-5);
        make.centerY.equalTo(self.priceLabel);
        make.height.mas_equalTo(25);
    }];
}

- (UIImageView *)leftImageView
{
    if(!_leftImageView)
    {
        _leftImageView = [[UIImageView alloc]init];
        _leftImageView.layer.borderWidth = 1;
        _leftImageView.layer.borderColor = [UIColor colorWithHexString:@"#EEEEEE"].CGColor;
        _leftImageView.layer.cornerRadius = 3;
        
    }
    return _leftImageView;
}

- (UILabel *)dtitle
{
    if(!_dtitle)
    {
        _dtitle  = [[UILabel alloc]init];
        _dtitle.textColor = [UIColor darkTextColor];
        _dtitle.numberOfLines = 0;
        _dtitle.lineBreakMode = NSLineBreakByWordWrapping;
        _dtitle.font = [UIFont fontWithName:ThemeFont size:15];
        _dtitle.textAlignment = NSTextAlignmentLeft;
        [_dtitle sizeToFit];
    }
    return _dtitle;
}

- (UIView *)botView
{
    if(!_botView)
    {
        _botView = [[UIView alloc]init];
        _botView.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    }
    return _botView;
}

- (UILabel *)priceLabel
{
    if(!_priceLabel)
    {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font  = [UIFont fontWithName:ThemeFont size:13];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.textColor =[UIColor colorWithRed:0.8 green:0 blue:0 alpha:1];
        [_priceLabel sizeToFit];
    }
    return _priceLabel;
}

- (UILabel *)logoLabel
{
    if(!_logoLabel)
    {
        _logoLabel = [[UILabel alloc]init];
        _logoLabel.font = [UIFont fontWithName:ThemeFont size:14];
        _logoLabel.textAlignment = NSTextAlignmentLeft;
        _logoLabel.textColor = [UIColor colorWithRed:0.8 green:0 blue:0 alpha:1];
        _logoLabel.text = @"￥";
        [_logoLabel sizeToFit];
    }
    return _logoLabel;
}
@end
