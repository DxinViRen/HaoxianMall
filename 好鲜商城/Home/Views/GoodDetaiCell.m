//
//  GoodDetaiCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/2.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "GoodDetaiCell.h"

#import "HomeSCHeadCell.h"


@interface GoodDetaiCell ()

@property (nonatomic,strong)UILabel *goodDetailLabell;
@property (nonatomic,strong)UILabel *titleLabel;

@end



@implementation GoodDetaiCell

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
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.goodDetailLabell];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(10.0f);
        make.top.equalTo(self.contentView).inset(15.0f);
        make.height.mas_equalTo(25);
    }];
    
    [self.goodDetailLabell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left).offset(15);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.0f);
        make.right.equalTo(self.contentView).inset(10.0f);
    }];
}

- (void)setModel:(GooddModel *)model
{
    _model  = model;
    
    CGFloat height = [self calculateTextHeightWithText:model.goodDetail];
    self.goodDetailLabell.text = _model.goodDetail;
    [self.goodDetailLabell mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left).offset(15);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.0f);
        make.right.equalTo(self.contentView).inset(10.0f);
        make.height.mas_equalTo(height + 50);
    }];
    
   
    
    
}

- (CGFloat)calculateTextHeightWithText:(NSString *)text
{
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:ThemeFont size:12.0f]} context:nil].size;
    return size.height;
}

- (UILabel *)titleLabel

{
    if(!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont fontWithName:ThemeFont size:18];
        _titleLabel.textColor = [UIColor darkTextColor];
        _titleLabel.text = @"商品介绍：";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UILabel *)goodDetailLabell
{
    if(!_goodDetailLabell)
    {
        _goodDetailLabell = [[UILabel alloc]init];
        _goodDetailLabell.font  = [UIFont fontWithName:ThemeFont size:13.0f];
        _goodDetailLabell.textAlignment = NSTextAlignmentLeft;
        _goodDetailLabell.textColor = [UIColor colorWithHexString:@"#333333"];
        _goodDetailLabell.lineBreakMode = NSLineBreakByWordWrapping;
        _goodDetailLabell.numberOfLines = 0;
        [_goodDetailLabell sizeToFit];
    }
    return _goodDetailLabell;
}


@end
