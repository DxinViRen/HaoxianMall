//
//  SectionSeporModel.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/29.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "SectionSeporModel.h"

@implementation SectionSeporModel

- (instancetype)initWithArray:(NSMutableArray<id<HomeCellModelProtocol>> *)array
{
    if(self = [super init])
    {
        self.dataArray = array;
    }
    return self;
}

- (SectionSeptemporModel *)headerModel
{
    if(!_headerModel)
    {
        _headerModel = [[SectionSeptemporModel alloc]init];
    }
    return _headerModel;
}

- (SectionSeptemporModel *)footModel
{
    if(!_footModel)
    {
        _footModel = [[SectionSeptemporModel alloc]init];
    }
    return _footModel;
}

#pragma mark - IGListDiffable
- (id<NSObject>)diffIdentifier
{
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object
{
    return [self isEqual:object];
}
@end
