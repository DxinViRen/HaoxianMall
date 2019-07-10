//
//  ShopCatCell.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/5.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GooddModel.h"
#import "OpNumViw.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^CalOpBlock)(NSInteger num,OpNumViw *opView);
@interface ShopCatCell : UICollectionViewCell<HomeListCellProtocol,OpNumCalProtocol>
@property (nonatomic,strong)GooddModel *model;
@property (nonatomic,copy)CalOpBlock opBlock;
@property (nonatomic,copy)void(^checkBlock)(UICollectionViewCell *cell,GooddModel *model);


@end

NS_ASSUME_NONNULL_END
