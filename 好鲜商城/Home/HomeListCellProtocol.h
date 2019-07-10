//
//  HomeListCellProtocol.h
//  好鲜商城
//
//  Created by D.xin on 2019/6/28.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HomeListCellProtocol <NSObject>
@property(nonatomic,strong)UIView *topSeptemporView;
@property(nonatomic,strong)UIView *downSeptempor;
@property(nonatomic,strong)id<HomeCellModelProtocol>model;
@end

NS_ASSUME_NONNULL_END
