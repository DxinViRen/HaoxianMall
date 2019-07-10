//
//  HomeCellModel.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "HomeCellModel.h"
NSString *const kHomeSectionHeaderDtitle = @"kHomeSectionHeaderDtitle";
NSString *const kHomeBannerArrayKey = @"kHomeBannerArrayKey";
NSString *const kHomeBannerTitlekey = @"kHomeBannerTitlekey";
NSString *const kHomeSCImageArrayKey = @"kHomeSCImageArrayKey";
NSString *const kHomeMenuItemTitleArray = @"kHomeMenuItemTitleArray";
NSString *const kGooddetailText = @"kGooddetailText";
@implementation HomeCellModel
@synthesize  cellHeight;
@synthesize  cellName;
@synthesize  cellInderfier;
@synthesize  cellWight;
@synthesize  extra;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellWight = ScrW;
    }
    return self;
}
@end
