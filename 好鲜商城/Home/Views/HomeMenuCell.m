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


@end



@implementation HomeMenuCell
@synthesize    topSeptemporView;
@synthesize    downSeptempor;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setModel:(id<HomeCellModelProtocol>)model
{
    _model = model;
    NSArray *itemArr = _model.extra[kHomeMenuItemTitleArray];
   
    CGFloat edg = 15.0f;
    CGFloat spc = 10.0f;
    CGFloat w   = (ScrW - 30 -spc) * 0.5;
    CGFloat h   =  (self.frame.size.height - 30) * 0.5;
    CGFloat y = 0;
    for (int i = 0; i <itemArr.count; i ++) {
        int index = i;
        if(index >1)
        {
            index = index - 2;
            y = h + 10;
        }
        HomeMenuItem * item = [[HomeMenuItem alloc]init];
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



@end
