//
//  HomeMenuItem.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/1.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeMenuItem : UIView

- (void)configItemWithTitle:(NSString *)title img:(NSString *)img;
@property (nonatomic,assign)NSInteger tag;
@end

NS_ASSUME_NONNULL_END
