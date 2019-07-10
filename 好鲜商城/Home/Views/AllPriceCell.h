//
//  AllPriceCell.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/8.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModel.h"
#import "GooddModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AllPriceCell : UICollectionViewCell<HomeListCellProtocol>

@property (nonatomic,strong)GooddModel *model;

@end

NS_ASSUME_NONNULL_END
