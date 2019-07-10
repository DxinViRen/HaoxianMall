//
//  GooddModel.m
//  好鲜商城
//
//  Created by D.xin on 2019/7/1.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "GooddModel.h"

@implementation GooddModel
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
        self.isCheck = NO;
        self.goodNum = 1;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    GooddModel *model  =[[[self class] allocWithZone:zone] init];
    model.imageName = _imageName;
    model.goodName = _goodName;
    model.goodPrNum = _goodPrNum;
    model.praice = _praice;
    model.goodNum = _goodNum;
    model.goodDetail = _goodDetail;
    return model;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    GooddModel *model = [[[self class]allocWithZone:zone] init];
    model.imageName = _imageName;
    model.goodName = _goodName;
    model.goodPrNum = _goodPrNum;
    model.goodNum = _goodNum;
    model.praice = _praice;
    model.goodDetail = _goodDetail;
    return model;
}
@end
