//
//  ShopCatOptionView.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/5.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "ShopCatOptionView.h"

@interface ShopCatOptionView ()

@property (nonatomic,strong)UIButton *jiesuanBtn;


@end




@implementation ShopCatOptionView
{
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
        //self.backgroundColor = [UIColor colorWithHexString:@"#FFE0D4"];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}



- (void)setUI
{
    [self addSubview:self.allSelectBtn];
    [self addSubview:self.jiesuanBtn];
    [self addSubview:self.currentBill];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.allSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.and.left.equalTo(self);
        make.width.mas_equalTo(100);
    }];
    
    [self.currentBill mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.allSelectBtn.mas_right).offset(10);
        make.top.and.bottom.equalTo(self);
    }];
    
    [self.jiesuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.and.bottom.equalTo(self);
        make.width.mas_equalTo(100);
    }];
}

- (UIButton *)allSelectBtn
{
    if(!_allSelectBtn)
    {
        _allSelectBtn  = [[UIButton alloc]init];
        [_allSelectBtn  setTitle:@"全选" forState:UIControlStateNormal];
        _allSelectBtn.backgroundColor = [UIColor redColor];;
        [_allSelectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_allSelectBtn addTarget:self action:@selector(allSelectAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _allSelectBtn;
}

- (UIButton *)jiesuanBtn
{
    if(!_jiesuanBtn)
    {
        _jiesuanBtn  =[[UIButton alloc]init];
        [_jiesuanBtn setTitle:@"结算" forState:UIControlStateNormal];
        _jiesuanBtn.backgroundColor = [UIColor redColor];;
        [_jiesuanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_jiesuanBtn addTarget:self action:@selector(jiesuanAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jiesuanBtn;
}

- (UILabel *)currentBill
{
    if(!_currentBill)
    {
        _currentBill  = [[UILabel alloc]init];
        _currentBill.font  = [UIFont fontWithName:ThemeFont size:13];
        _currentBill.textColor  = [UIColor whiteColor];
        _currentBill.textAlignment = NSTextAlignmentCenter;
        [_currentBill sizeToFit];
}
    
    return _currentBill;
}

- (void)allSelectAction:(UIButton *)btn
{
    if(!self.isAllSelect)
    {
         [self.allSelectBtn  setTitle:@"取消全选" forState:UIControlStateNormal];
        if([self.delegate respondsToSelector:@selector(shopCarAllSelectWithView:)])
        {
            [self.delegate shopCarAllSelectWithView:self];
        }
        
    }
    else
    {
         [self.allSelectBtn  setTitle:@"全选" forState:UIControlStateNormal];
         if([self.delegate respondsToSelector:@selector(cancelAllSelectWithView:)])
         {
             [self.delegate cancelAllSelectWithView:self];
         }
    }
    
    self.isAllSelect = !self.isAllSelect;
}


- (void)jiesuanAction:(UIButton *)btn
{
    
    if([self.delegate respondsToSelector:@selector(shopCarJiesuanWithView:)])
    {
        [self.delegate shopCarJiesuanWithView: self];
    }
}


@end
