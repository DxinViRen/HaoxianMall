//
//  AddShopCarView.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/2.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GooddModel.h"
NS_ASSUME_NONNULL_BEGIN


@interface AddShopCarView : UIView
@property (nonatomic,copy)void(^adShopBlock)(void);
@property (nonatomic,copy)void(^lookOverBlock)(void);
- (void)dissMissView;
- (void)showView;
@end

NS_ASSUME_NONNULL_END
