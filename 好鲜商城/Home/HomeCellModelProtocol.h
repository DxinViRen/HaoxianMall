//
//  HomeCellModelProtocol.h
//  好鲜商城
//
//  Created by D.xin on 2019/6/28.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HomeCellModelProtocol <NSObject>
@property(nonatomic,assign)CGFloat  cellHeight;
@property(nonatomic,copy)NSString *cellName;
@property(nonatomic,copy)NSString *cellInderfier;
@property(nonatomic,assign)CGFloat cellWight;
@property(nonatomic,strong)NSMutableDictionary *extra;

@end

NS_ASSUME_NONNULL_END
