//
//  SectionSeptemporModel.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/29.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "SectionSeptemporModel.h"

@implementation SectionSeptemporModel

- (instancetype)init
{
    if(self = [super init])
    {
        self.sepotHeight = 10.0f;
        self.septemBackGroundColor = [UIColor colorWithHexString:@"F8F8F8"];
        
    }
    return self;
}


- (void)setSepotHeight:(CGFloat)sepotHeight
{
    if(sepotHeight<0.01)
    {
        sepotHeight = 0.01;
    }
    _sepotHeight = sepotHeight;
}

#pragma mark - IGListDiffable

- (nonnull id<NSObject>)diffIdentifier
{
    return self;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object
{
    return [self isEqual:object];
}
@end
