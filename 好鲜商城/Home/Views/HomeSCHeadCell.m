//
//  HomeSCHeadCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "HomeSCHeadCell.h"
@interface HomeSCHeadCell ()<UIScrollViewDelegate>
@property(nonatomic,strong)UILabel *dTitleLabel;
@property(nonatomic,strong)UIScrollView *scView;

@end



@implementation HomeSCHeadCell
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
        [self configCell];
    }
    return self;
}



- (void)configCell
{
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    [self.contentView addSubview:self.dTitleLabel];
    @WeakObj(self);
    [selfWeak.dTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(selfWeak.contentView).inset(15.0f);
        make.centerY.equalTo(selfWeak.contentView);
        make.height.mas_equalTo(20.0f);
    }];
}





- (void)setModel:(id<HomeCellModelProtocol>)model
{
    self.dTitleLabel.text  = model.extra[kHomeSectionHeaderDtitle];
}

#pragma mark - getter
- (UILabel *)dTitleLabel
{
    if(!_dTitleLabel)
    {
        _dTitleLabel = [[UILabel alloc]init];
        _dTitleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _dTitleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18.0f];
        _dTitleLabel.textAlignment = NSTextAlignmentLeft;
        [_dTitleLabel sizeToFit];
    }
    return _dTitleLabel;
}
@end
