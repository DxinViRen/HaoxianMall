//
//  HoScrollCell.h
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HoScrollCell : UICollectionViewCell<HomeListCellProtocol>
@property(nonatomic,strong)id<HomeCellModelProtocol>model;
@end

NS_ASSUME_NONNULL_END
