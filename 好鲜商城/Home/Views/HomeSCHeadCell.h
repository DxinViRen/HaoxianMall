//
//  HomeSCHeadCell.h
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeSCHeadCell : UICollectionViewCell<HomeListCellProtocol>
@property (nonatomic,strong)id <HomeCellModelProtocol>model;

@end

NS_ASSUME_NONNULL_END
