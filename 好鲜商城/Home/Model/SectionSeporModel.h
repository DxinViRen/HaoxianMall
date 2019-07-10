//
//  SectionSeporModel.h
//  好鲜商城
//
//  Created by D.xin on 2019/6/29.
//  Copyright © 2019 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeCellModelProtocol.h"
#import "SectionSeptemporModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SectionSeporModel : NSObject<IGListDiffable>

/**
 最后一个section是否显示separator;
 */
@property(nonatomic,assign)BOOL isShowDownSeparatorAtLastSection;

/**
 数据源
 */
@property(nonatomic,strong)NSMutableArray *dataArray;



/**
 头部 默认高度是10
 */
@property(nonatomic,strong)SectionSeptemporModel *headerModel;


/**
 底部d 默认高度是10.
 */
@property(nonatomic,strong)SectionSeptemporModel *footModel;

/**
 C初始化

 @param array itemArray
 @return SectionModel
 */
- (instancetype)initWithArray:(NSMutableArray <id<HomeCellModelProtocol>>*)array;


@end

NS_ASSUME_NONNULL_END
