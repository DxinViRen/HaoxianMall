//
//  HomeBannerCell.h
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "HomeCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeBannerCell : UICollectionViewCell<HomeListCellProtocol>

@property (nonatomic,strong)id <HomeCellModelProtocol>model;

@end

NS_ASSUME_NONNULL_END
