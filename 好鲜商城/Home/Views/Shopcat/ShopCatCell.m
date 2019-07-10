//
//  ShopCatCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/5.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "ShopCatCell.h"

@interface ShopCatCell ()
@property(nonatomic,strong)UIImageView *goodImageView;
@property(nonatomic,strong)UILabel     *goodNameLabel;
@property(nonatomic,strong)UILabel     *priceLabel;
@property(nonatomic,strong)UILabel     *goodNuMlable;
@property(nonatomic,strong)UIView      *botLineView;
@property(nonatomic,strong)OpNumViw    *opview;
@property(nonatomic,strong)UIButton    *chexBox;


@end






@implementation ShopCatCell
{
    BOOL currentStatus;
}
@synthesize downSeptempor;
@synthesize topSeptemporView;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
        currentStatus = NO;
    }
    return self;
}

- (void)setUI
{
    [self.contentView addSubview:self.goodNameLabel];
    [self.contentView addSubview:self.goodNuMlable];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.goodImageView];
    [self.contentView addSubview:self.botLineView];
    [self.contentView addSubview:self.opview];
    [self.contentView addSubview:self.chexBox];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    @WeakObj(self);
    [self.goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.contentView).inset(10.0f);
        make.left.equalTo(selfWeak.contentView).inset(45.0f);
        make.centerY.equalTo(selfWeak.contentView);
        make.width.equalTo(selfWeak.goodImageView.mas_height);
    }];
    
    [self.goodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.goodImageView).offset(5);
        make.left.equalTo(selfWeak.goodImageView.mas_right).offset(8);
        make.right.lessThanOrEqualTo(selfWeak.opview).offset(5);
    }];
    
    [self.opview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.goodNameLabel.mas_bottom).offset(20);
        make.right.equalTo(selfWeak.contentView).inset(20);
        make.height.mas_equalTo(30.0f);
        make.width.mas_equalTo(100);
    }];
    
    [self.botLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(selfWeak.goodImageView.mas_right);
        make.right.equalTo(selfWeak.contentView);
        make.bottom.equalTo(selfWeak.contentView);
        make.height.mas_equalTo(1.0f);
    }];

    [self.chexBox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(15.0f);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    
    
}

- (void)setModel:(GooddModel *)model
{
    _model = model;
    self.goodImageView.image = [UIImage imageNamed:_model.imageName];
    self.goodNuMlable.text   = _model.goodPrNum;
    self.priceLabel.text     = _model.praice;
    self.goodNameLabel.text  = _model.goodName;
    self.opview.numLabel.text = [NSString stringWithFormat:@"%ld",_model.goodNum];
    [self setCheckBtnStatus];
}

#pragma mark - OPNumProtocol
- (void)CalgoodNumWithNum:(NSInteger)num view:(OpNumViw *)numView
{
    if(self.opBlock)
    {
        self.opBlock(num, numView);
    }
}


- (UIView *)botLineView
{
    if(!_botLineView)
    {
        _botLineView = [[UIView alloc]init];
        _botLineView.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    }
    return _botLineView;
}


- (OpNumViw *)opview
{
    if(!_opview)
    {
        _opview = [[OpNumViw alloc]init];
        _opview.layer.borderWidth = 1;
        _opview.layer.borderColor = [UIColor colorWithHexString:@"#555555"].CGColor;
        _opview.delegate = self;
    }
    return _opview;

}


- (UILabel *)goodNameLabel
{
    if(!_goodNameLabel)
    {
        _goodNameLabel = [[UILabel alloc]init];
        _goodNameLabel.textColor = [UIColor colorWithHexString:@"#444444"];
        _goodNameLabel.font = [UIFont fontWithName:ThemeFont size:14];
        _goodNameLabel.textAlignment = NSTextAlignmentLeft;
        [_goodNameLabel sizeToFit];
    }
    return _goodNameLabel;
}

- (UILabel *)priceLabel
{
    if(!_priceLabel)
    {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font  = [UIFont fontWithName:ThemeFont size:12];
        _priceLabel.textColor  = [UIColor redColor];
        _priceLabel.textAlignment  = NSTextAlignmentCenter;
        [_priceLabel sizeToFit];
    }
    return _priceLabel;
}


- (UILabel *)goodNuMlable
{
    if(!_goodNuMlable)
    {
        _goodNuMlable = [[UILabel alloc]init];
        _goodNuMlable.font  = [UIFont fontWithName:ThemeFont size:12];
        _goodNuMlable.textColor = [UIColor colorWithHexString:@"#999999"];
        [_goodNuMlable sizeToFit];
        _goodNuMlable.textAlignment = NSTextAlignmentCenter;
    }
    return _goodNuMlable;
}


- (UIImageView *)goodImageView
{
    if(!_goodImageView)
    {
        _goodImageView = [[UIImageView alloc]  init];
        _goodImageView.contentMode  = UIViewContentModeScaleAspectFit;
    }
    return _goodImageView;
}

- (UIButton *)chexBox
{
    if(!_chexBox)
    {
        _chexBox  = [[UIButton alloc]init];
//        [_chexBox setImage:[UIImage imageNamed:@"unSelect"] forState:UIControlStateNormal];
        [_chexBox addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chexBox;
}


- (void)checkAction:(UIButton *)btn
{
    [self setCheckBtnStatus];
    
    if(self.model.isCheck)
    {
        [_chexBox setImage:[UIImage imageNamed:@"unSelect"] forState:UIControlStateNormal];
    }
    else
    {
        [_chexBox setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    }
    
    self.model.isCheck = !self.model.isCheck;
    
    if(self.checkBlock)
    {
        self.checkBlock(self, self.model);
    }
}

- (void)setCheckBtnStatus
{
    if(self.model.isCheck)
    {
        [_chexBox setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    }
    else
    {
        [_chexBox setImage:[UIImage imageNamed:@"unSelect"] forState:UIControlStateNormal];
    }
    
 
}
@end
