//
//  GooddModel.h
//  好鲜商城
//
//  Created by D.xin on 2019/7/1.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GooddModel : NSObject<HomeCellModelProtocol,NSCopying,NSMutableCopying>
@property (nonatomic,copy)NSString    *imageName;
@property (nonatomic,copy)NSString    *goodName;
@property (nonatomic,copy)NSString    *goodPrNum;
@property (nonatomic,copy)NSString    *praice;
@property (nonatomic,copy)NSString    *goodDetail;
@property (nonatomic,assign)BOOL      isCheck;
@property (nonatomic,assign)NSInteger goodNum;

@end

NS_ASSUME_NONNULL_END
