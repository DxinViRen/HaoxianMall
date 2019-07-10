//
//  GoodDetailCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/1.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "GoodDetailCell.h"

@interface GoodDetailCell ()

@property (nonatomic,strong)UIImageView *goodImageView;
@property (nonatomic,strong)UILabel     *goodNameLabel;
@property (nonatomic,strong)UILabel     *praiseNumLabel;
@property (nonatomic,strong)UILabel     *praiceLabel;
@property (nonatomic,strong)UIView      *lineView;


@end


@implementation GoodDetailCell
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
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    [self.contentView addSubview:self.goodImageView];
    [self.contentView addSubview:self.goodNameLabel];
    [self.contentView addSubview:self.praiceLabel];
    [self.contentView addSubview:self.praiseNumLabel];
    [self.contentView addSubview:self.lineView];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
}


 - (void)setModel:(GooddModel *)model
{
    _model = model;
    self.goodImageView.image = [UIImage imageNamed:_model.imageName];
    self.goodNameLabel.text = _model.goodName;
    self.praiceLabel.text = [NSString stringWithFormat:@"优惠价：￥%@",_model.praice];
    self.praiseNumLabel.text =[NSString stringWithFormat:@"原价：￥%@",_model.goodPrNum];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    @WeakObj(self);
    [self.goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(selfWeak.contentView);
        make.left.equalTo(selfWeak.contentView).inset(10.0f);
        make.top.equalTo(selfWeak.contentView).inset(10.0f);
        make.height.mas_equalTo(selfWeak.contentView.frame.size.height - 80.0f);
    }];
    
    [self.goodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(selfWeak.goodImageView);
        make.top.equalTo(selfWeak.goodImageView.mas_bottom).offset(20.0f);
        make.height.mas_equalTo(30.0f);
    }];
    
    
    [self.praiseNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(selfWeak.contentView).inset(10.0f);
        make.height.mas_equalTo(20.0f);
        make.centerY.equalTo(selfWeak.goodNameLabel);
    }];
    
    [self.praiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(selfWeak.goodNameLabel);
        make.right.equalTo(selfWeak.praiseNumLabel.mas_left).offset(-30.0f);
        make.left.greaterThanOrEqualTo(selfWeak.goodNameLabel.mas_right).offset(10.0f);
        make.height.mas_equalTo(20.0f);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(selfWeak.contentView);
        make.right.equalTo(selfWeak.contentView);
        make.bottom.equalTo(selfWeak.contentView);
        make.height.mas_equalTo(0.5);
    }];
    
    
 
}

- (UIImageView *)goodImageView
{
    if(!_goodImageView)
    {
        _goodImageView = [[UIImageView alloc]init];
        
        
    }
    return _goodImageView;
}

- (UILabel *)praiceLabel
{
    if(!_praiceLabel)
    {
        _praiceLabel = [[UILabel alloc]init];
        _praiceLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _praiceLabel.font = [UIFont fontWithName:ThemeFont size:13.0f];
        _praiceLabel.textAlignment = NSTextAlignmentLeft;
        [_praiceLabel sizeToFit];
        
    }
    return _praiceLabel;
}

- (UILabel *)praiseNumLabel
{
    if(!_praiseNumLabel)
    {
        _praiseNumLabel = [[UILabel alloc]init];
        _praiseNumLabel.textColor  =[UIColor colorWithHexString:@"#999999"];
        _praiseNumLabel.font  = [UIFont fontWithName:ThemeFont size:13.0f];
        _praiseNumLabel.textAlignment = NSTextAlignmentLeft;
        [_praiseNumLabel sizeToFit];
    }
    return _praiseNumLabel;
}


- (UILabel *)goodNameLabel
{
    if(!_goodNameLabel)
    {
        _goodNameLabel = [[UILabel alloc]init];
        _goodNameLabel.font  = [UIFont fontWithName:ThemeFont size:15.0f];
        _goodNameLabel.textColor  =[UIColor colorWithHexString:@"#333333"];
        _goodNameLabel.textAlignment  = NSTextAlignmentLeft;
        [_goodNameLabel sizeToFit];
    }
    return _goodNameLabel;
}

- (UIView *)lineView
{
    if(!_lineView)
    {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#aaaaaa"];
    }
    return _lineView;
}

@end
