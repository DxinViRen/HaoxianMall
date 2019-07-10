//
//  GetGoodsAdressCell.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/8.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GooddModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol TextFiledActionDelegate <NSObject>

- (void)textFieldOptionWithTextFiled:(UITextField *)textField;

@end


@interface GetGoodsAdressCell : UICollectionViewCell<HomeListCellProtocol>
@property (nonatomic,strong)GooddModel *model;
@property (nonatomic,strong)UILabel *dTitleLabel;
@property (nonatomic,strong)UITextField *adressssTextField;
@property (nonatomic,strong)UIView *lineView;
@property (nonatomic,weak)id<TextFiledActionDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
