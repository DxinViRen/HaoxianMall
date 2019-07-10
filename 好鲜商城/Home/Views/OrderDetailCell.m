//
//  OrderDetailCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/9.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "OrderDetailCell.h"


@interface OrderDetailCell ()
@property(nonatomic,strong)UILabel *goodNumLabel;
@property(nonatomic,strong)UILabel *xLabel;
@end



@implementation OrderDetailCell

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
    [self.contentView addSubview:self.xLabel];
    [self.contentView addSubview:self.goodNumLabel];
}

- (void)layoutSubviews
{
   
    [super layoutSubviews];
    [self.xLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dtitle);
        make.bottom.equalTo(self.contentView).inset(10);
        make.size.mas_equalTo(CGSizeMake(15, 25));
    }];
     
    [self.goodNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xLabel.mas_right).offset(0);
        make.centerY.equalTo(self.xLabel);
        make.height.mas_equalTo(20.0f);
    }];
}

- (void)setModel:(GooddModel *)model
{
    [super setModel:model];
    _goodNumLabel.text = [NSString stringWithFormat:@"%ld",model.goodNum];
}

#pragma mark - getter
- (UILabel *)goodNumLabel
{
    if(!_goodNumLabel)
    {
        _goodNumLabel = [[UILabel alloc]init];
        _goodNumLabel.font = [UIFont fontWithName:ThemeFont size:18.0f];
        _goodNumLabel.textColor = [UIColor colorWithHexString:@"#555555"];
        _goodNumLabel.textAlignment = NSTextAlignmentCenter;
        [_goodNumLabel sizeToFit];
    }
    return _goodNumLabel;
}

- (UILabel *)xLabel
{
    if(!_xLabel)
    {
        _xLabel = [[UILabel alloc]init];
        _xLabel.font = [UIFont fontWithName:ThemeFont size:14.0f];
        _xLabel.textColor = [UIColor colorWithHexString:@"#555555"];
        _xLabel.textAlignment = NSTextAlignmentLeft;
        _xLabel.text  = @"X";
    }
    return _xLabel;
}
@end
