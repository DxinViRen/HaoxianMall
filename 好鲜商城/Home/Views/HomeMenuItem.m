//
//  HomeMenuItem.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/1.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "HomeMenuItem.h"

@interface HomeMenuItem ()
@property (nonatomic,strong)UILabel *itemTitleLabel;
@property (nonatomic,strong)UIImageView *mainImageView;

@end






@implementation HomeMenuItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.mainImageView];
        [self addSubview:self.itemTitleLabel];
        self.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
        self.layer.cornerRadius = 3;
        self.userInteractionEnabled = YES;
        self.layer.shadowColor = [UIColor colorWithHexString:@"F8F8F8"].CGColor;
        self.layer.shadowOffset = CGSizeMake(2, 2);
        self.layer.borderColor = [UIColor colorWithHexString:@"#EEEEEE"].CGColor;
        self.layer.borderWidth = 1;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    NSDictionary * dic = @{@"tag":@(self.tag)};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tag" object:nil userInfo:dic];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    @WeakObj(self);
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(selfWeak);
        make.left.equalTo(selfWeak);
        make.right.equalTo(selfWeak);
        make.height.equalTo(selfWeak.mas_height).multipliedBy(0.7);
    }];
    
    [self.itemTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(selfWeak);
        make.height.equalTo(selfWeak.mas_height).multipliedBy(0.2);
        make.bottom.equalTo(selfWeak);
    }];
}
- (void)configItemWithTitle:(NSString *)title img:(NSString *)img
{
    self.mainImageView.image = [UIImage imageNamed:img];
    self.itemTitleLabel.text = title;
}

#pragma mark - getter
- (UIImageView *)mainImageView
{
    if(!_mainImageView)
    {
        _mainImageView = [[UIImageView alloc]init];
        
    }
    return _mainImageView;
}

- (UILabel *)itemTitleLabel
{
    if(!_itemTitleLabel)
    {
        _itemTitleLabel = [[UILabel alloc]init];
        _itemTitleLabel.font = [UIFont fontWithName:ThemeFont size:13.0f];
        _itemTitleLabel.textColor = [UIColor colorNamed:@"666666"];
        [_itemTitleLabel sizeToFit];
    }
    return _itemTitleLabel;
}
@end
