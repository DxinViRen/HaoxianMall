//
//  GoodLIstItemCell.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/2.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GooddModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GoodLIstItemCell : UICollectionViewCell<HomeListCellProtocol>
@property (nonatomic,strong)GooddModel *model;
@property(nonatomic,strong)UIImageView *leftImageView;
@property(nonatomic,strong)UILabel *dtitle;
@property(nonatomic,strong)UIView *botView;
@property(nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UILabel *logoLabel;
@end

NS_ASSUME_NONNULL_END
