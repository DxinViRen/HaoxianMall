//
//  GetGoodsAdressCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/8.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "GetGoodsAdressCell.h"

@interface GetGoodsAdressCell ()<UITextFieldDelegate>


@end



@implementation GetGoodsAdressCell
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
        [self setuiUI];
    }
    return self;
}

- (void)setModel:(GooddModel *)model
{
    _model = model;
    self.dTitleLabel.text = model.goodName;
    self.adressssTextField.placeholder = model.imageName;
}

- (void)setuiUI
{
    [self.contentView addSubview:self.dTitleLabel];
    [self.contentView addSubview:self.adressssTextField];
    [self.contentView addSubview:self.lineView];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.dTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(15.0f);
        make.centerY.equalTo(self.contentView);
        make.height.mas_offset(20.0f);
    }];
    
    [self.adressssTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.dTitleLabel.mas_right).offset(10.0f);
        make.height.mas_offset(22.0);
        make.width.mas_equalTo(200);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(15.0f);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.8);
        make.bottom.equalTo(self.contentView);
    }];
}

- (UILabel *)dTitleLabel
{
    if(!_dTitleLabel)
    {
        _dTitleLabel = [[UILabel alloc]init];
        _dTitleLabel.textColor = [UIColor colorWithHexString:@"#444444"];
        _dTitleLabel.font  = [UIFont fontWithName:ThemeFont size:15.0f];
        _dTitleLabel.textAlignment = NSTextAlignmentLeft;
        [_dTitleLabel sizeToFit];
    }
    return _dTitleLabel;
}

- (UITextField *)adressssTextField
{
    if(!_adressssTextField)
    {
        _adressssTextField = [[UITextField alloc]init];
        _adressssTextField.delegate = self;
        [_adressssTextField addTarget:self action:@selector(textFielEdAction:) forControlEvents:UIControlEventEditingChanged];
        _adressssTextField.placeholder = @"请输入你的联系方式和地址";
        _adressssTextField.textColor = [UIColor colorWithHexString:@"#444444"];
        _adressssTextField.font = [UIFont fontWithName:ThemeFont size:15];
    }
    return _adressssTextField;
}

- (UIView *)lineView
{
    if(!_lineView)
    {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    }
    return _lineView;
}

- (void)textFielEdAction:(UITextField *)textfield
{
    if([self.delegate respondsToSelector:@selector(textFieldOptionWithTextFiled:)])
    {
        [self.delegate textFieldOptionWithTextFiled:textfield];
    }
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"12345");
}

@end
