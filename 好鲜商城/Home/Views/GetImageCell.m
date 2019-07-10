//
//  GetImageCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/10.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "GetImageCell.h"

@interface GetImageCell ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *messageLabel;

@end

@implementation GetImageCell

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

- (void)setModel:(GooddModel *)model
{
    _model = model;
}

- (void)setupUI
{
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.messageLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(15.0f);
        make.top.equalTo(self.contentView).inset(10.0f);
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(20.0f);
        make.bottom.equalTo(self.contentView).inset(10.0f);
        make.height.mas_equalTo(16);
        make.centerX.equalTo(self.contentView);
    }];
}


- (UIImageView *)imageView
{
    if(!_imageView)
    {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"logist_havno"];
    }
    return _imageView;
}

- (UILabel *)messageLabel
{
    if(!_messageLabel)
    {
        
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.font  = [UIFont fontWithName:ThemeFont size:15];
        _messageLabel.textColor = [UIColor colorWithHexString:@"#444444"];
        _messageLabel.text = @"您的宝贝正在火速送来，请耐心等待！";
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        [_messageLabel sizeToFit];
    }
    return _messageLabel;
}
@end
