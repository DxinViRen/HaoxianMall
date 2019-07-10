//
//  GoodDetaiCell.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/2.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GooddModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GoodDetaiCell : UICollectionViewCell<HomeListCellProtocol>
@property (nonatomic,strong)GooddModel *model;

@end

NS_ASSUME_NONNULL_END
