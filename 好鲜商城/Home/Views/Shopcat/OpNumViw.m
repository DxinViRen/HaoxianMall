//
//  OpNumViw.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/5.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "OpNumViw.h"

@interface OpNumViw ()

@property(nonatomic,strong)UIButton *addBtn;
@property(nonatomic,strong)UIButton *minusBtn;

@end



@implementation OpNumViw

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI
{
    [self addSubview:self.numLabel];
    [self addSubview:self.minusBtn];
    [self addSubview:self.addBtn];
}




- (void)layoutSubviews
{
    [super layoutSubviews];
    @WeakObj(self);
    [selfWeak.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak);
        make.bottom.equalTo(selfWeak);
        make.right.equalTo(selfWeak);
        make.height.mas_equalTo(30);
        make.width.equalTo(selfWeak.addBtn.mas_height);
    }];
    
    
    [selfWeak.minusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak);
        make.bottom.equalTo(selfWeak);
        make.left.equalTo(selfWeak);
        make.width.mas_equalTo(30);
    }];
    
    
    [selfWeak.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak);
        make.bottom.equalTo(selfWeak);
        make.height.mas_equalTo(30);
        make.right.equalTo(selfWeak.addBtn.mas_left);
        make.left.equalTo(selfWeak.minusBtn.mas_right);
    }];

    
    
}

- (UILabel *)numLabel
{
    if(!_numLabel)
    {
        _numLabel = [[UILabel alloc]init];
        _numLabel.textColor = [UIColor colorWithHexString:@"#444444"];
        _numLabel.textAlignment = NSTextAlignmentCenter;
       
        _numLabel.layer.borderColor = [UIColor colorWithHexString:@"#44444"].CGColor;
        _numLabel.layer.borderWidth =1 ;
        _numLabel.text = @"1";
        _numLabel.font = [UIFont fontWithName:ThemeFont size:12.0f];
        [_numLabel sizeToFit];
    }
    return _numLabel;
}

- (UIButton *)addBtn
{
    if(!_addBtn)
    {
        _addBtn = [[UIButton alloc]init];
       
        _addBtn.tag = 1;
        _addBtn.layer.borderColor = [UIColor colorWithHexString:@"#444444"].CGColor;
        _addBtn.layer.borderWidth =1 ;
        [_addBtn setTitle:@"+" forState:UIControlStateNormal];
        _addBtn.titleLabel.font = [UIFont fontWithName:ThemeFont size:12.0];
        [_addBtn setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(numOptionAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}

- (UIButton *)minusBtn
{
    if(!_minusBtn)
    {
        _minusBtn = [[UIButton alloc]init];
        _minusBtn.tag = 2;
        _minusBtn.layer.borderColor = [UIColor colorWithHexString:@"#44444"].CGColor;
        _minusBtn.layer.borderWidth =1 ;
        
        [_minusBtn setTitle:@"-" forState:UIControlStateNormal];
        _minusBtn.titleLabel.font = [UIFont fontWithName:ThemeFont size:12.0];
        [_minusBtn setTitleColor:[UIColor colorWithHexString:@"#444444"] forState:UIControlStateNormal];
        [_minusBtn addTarget:self action:@selector(numOptionAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _minusBtn;
}

- (void)numOptionAction:(UIButton *)btn
{
    NSString * title = self.numLabel.text;
    
    if(btn.tag == 1)
    {
        title = [NSString stringWithFormat:@"%ld",[title integerValue] + 1];
    }
    else
    {
        
        title = [NSString stringWithFormat:@"%ld",[title integerValue] - 1];
        if([title integerValue] <=0)
        {
            title =@"1";
        }
    }
    
    self.numLabel.text = title;
   
    if([self.delegate respondsToSelector:@selector(CalgoodNumWithNum:view:)])
    {
        [self.delegate CalgoodNumWithNum:[title integerValue] view:self];
    }
}
@end
