//
//  OpNumViw.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/5.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class OpNumViw;
@protocol OpNumCalProtocol <NSObject>

@optional
- (void)CalgoodNumWithNum:(NSInteger)num view:(OpNumViw *)numView;

@end



@interface OpNumViw : UIView
@property (nonatomic,weak)id<OpNumCalProtocol>delegate;
@property(nonatomic,strong)UILabel *numLabel;
@end

NS_ASSUME_NONNULL_END
