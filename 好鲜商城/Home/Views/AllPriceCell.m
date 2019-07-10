//
//  AllPriceCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/8.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "AllPriceCell.h"


@interface AllPriceCell ()
@property (nonatomic,strong)UILabel *mainTitleLabel;
@property (nonatomic,strong)UILabel *priceLabel;
@property (nonatomic,strong)UIView *lineView; //

@end



@implementation AllPriceCell
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
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.mainTitleLabel];
    [self.contentView addSubview:self.lineView];
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.mainTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(15.0f);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(20);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mainTitleLabel.mas_right).offset(10.0f);
        make.centerY.equalTo(self.mainTitleLabel);
        make.height.equalTo(self.mainTitleLabel);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(15.0f);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.8);
        make.bottom.equalTo(self.contentView);
    }];
}


- (void)setModel:(GooddModel *)model
{
    _model = model;
    self.mainTitleLabel.text = _model.goodName;
    self.priceLabel.text = _model.praice;
}

- (UILabel *)mainTitleLabel
{
    if(!_mainTitleLabel)
    {
        _mainTitleLabel = [[UILabel alloc]init];
        _mainTitleLabel.textColor = [UIColor colorWithHexString:@"#444444"];
        _mainTitleLabel.textAlignment = NSTextAlignmentLeft;
        _mainTitleLabel.font  = [UIFont fontWithName:ThemeFont size:15.0f];
        [_mainTitleLabel sizeToFit];
    }
    return _mainTitleLabel;
}

- (UILabel *)priceLabel
{
    if(!_priceLabel)
    {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.font = [UIFont fontWithName:ThemeFont size:15.0f];
        _priceLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        [_priceLabel sizeToFit];
    }
    return _priceLabel;
}

- (UIView *)lineView
{
    if(!_lineView)
    {
        _lineView  = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    }
    return _lineView;
}
@end
