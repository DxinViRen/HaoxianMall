//
//  ShopCatOptionView.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/5.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ShopCatOptionView;
@protocol shopCarOptionDelegate <NSObject>

@optional
- (void)shopCarAllSelectWithView:(ShopCatOptionView *)shoView ;
- (void)shopCarJiesuanWithView:(ShopCatOptionView *)view;
- (void)cancelAllSelectWithView:(ShopCatOptionView *)view;

@end



@interface ShopCatOptionView : UIView
@property (nonatomic,strong)id<shopCarOptionDelegate>delegate;
@property (nonatomic,strong)UILabel  *currentBill;
@property (nonatomic,strong)UIButton *allSelectBtn;
@property (nonatomic,assign)BOOL isAllSelect;
@end

NS_ASSUME_NONNULL_END
