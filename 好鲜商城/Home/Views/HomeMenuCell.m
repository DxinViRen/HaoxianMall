//
//  HomeMenuCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "HomeMenuCell.h"
#import "HomeMenuItem.h"
@interface HomeMenuCell ()
@property (nonatomic,strong)UIView *dwonView;

@end



@implementation HomeMenuCell
@synthesize    topSeptemporView;
@synthesize    downSeptempor;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView addSubview:self.dwonView];
    [self.dwonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(0.8);
    }];
}


- (void)setModel:(id<HomeCellModelProtocol>)model
{
    _model = model;
    NSArray *itemArr = _model.extra[kHomeMenuItemTitleArray];
   
    CGFloat edg = 15.0f;
    CGFloat spc = 10.0f;
    CGFloat w   = (ScrW - 30 -spc) * 0.5;
    CGFloat h   =  (self.frame.size.height - 30) * 0.5;
    CGFloat y = 10;
    for (int i = 0; i <itemArr.count; i ++) {
        int index = i;
        if(index >1)
        {
            index = index - 2;
            y = h + 20;
        }
        HomeMenuItem * item = [[HomeMenuItem alloc]init];
        item.layer.cornerRadius = 5;
        item.tag = i;
        item.frame = CGRectMake(edg + index * (w +spc),y, w, h);
        [self.contentView addSubview:item];
        [item configItemWithTitle:itemArr[i][@"text"] img:itemArr[i][@"img"]];
    }
}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    }
    return self;
}


- (UIView *)dwonView
{
    if(!_dwonView)
    {
        _dwonView = [[UIView alloc]init];
        _dwonView.backgroundColor  = [UIColor colorWithHexString:@"#EEEEEE"];
    }
    return _dwonView;
}
@end
