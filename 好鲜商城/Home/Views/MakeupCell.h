//
//  MakeupCell.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/10.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GooddModel.h"
NS_ASSUME_NONNULL_BEGIN

extern NSString *const NoitificationMakeUpOrder ;

@interface MakeupCell : UICollectionViewCell<HomeListCellProtocol>
@property (nonatomic,strong)GooddModel *model;
@property (nonatomic,copy)void(^makeupAction)(void);
@end

NS_ASSUME_NONNULL_END
