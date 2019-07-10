//
//  ItemView.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "ItemView.h"
@interface ItemView ()
@property(nonatomic,strong)UIButton *itemBtn;
@property(nonatomic,strong)UILabel  *titleLabel;
@end







@implementation ItemView
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
    
}

#pragma mark - getter
- (UILabel *)titleLabel
{
    if(!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont fontWithName:@"" size:13.0f];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}


- (UIButton *)itemBtn
{
    if(!_itemBtn)
    {
        _itemBtn = [[UIButton alloc]init];
        
    }
    return _itemBtn;
}

@end
