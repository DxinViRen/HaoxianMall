//
//  HomeBannerCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "HomeBannerCell.h"

@interface HomeBannerCell ()<SDCycleScrollViewDelegate>
@property(nonatomic,assign)CGRect p_frame;
@property (nonatomic,strong)SDCycleScrollView *cycleScview;  //轮播组件
@end





@implementation HomeBannerCell
@synthesize    topSeptemporView;
@synthesize    downSeptempor;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor redColor];
        self.p_frame = frame;
    }
    return self;
}

- (void)setModel:(id<HomeCellModelProtocol>)model
{
    _model = model;
    if(self.cycleScview)
    {
        [self.cycleScview removeFromSuperview];
    }
    NSArray *bannerImageArray = _model.extra[kHomeBannerArrayKey];
    NSArray *titleArry = _model.extra[kHomeBannerTitlekey];
    self.cycleScview = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:nil];
    self.cycleScview.imageURLStringsGroup = bannerImageArray;
    self.cycleScview.titlesGroup = titleArry;
    self.cycleScview.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    [self.contentView addSubview:self.cycleScview];
}



/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    
}



 
@end
