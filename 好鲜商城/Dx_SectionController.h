//
//  Dx_SectionController.h
//  好鲜商城
//
//  Created by D.xin on 2019/6/28.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "IGListSectionController.h"
#import "SectionSeporModel.h"
#import "SectionSeptemporModel.h"
#import "Home/HomeListCellProtocol.h"
#import "Home/HomeCellModelProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Dx_SectionController : IGListSectionController
@property(nonatomic,copy)void(^cellDidClickBlock)(id model,NSInteger index); //cell 的点击block

//配置cellBlock
@property(nonatomic,copy)void(^configCellBlock)(id model,NSInteger index,UICollectionViewCell *cell);

//sectionModel
@property(nonatomic,strong)SectionSeporModel *object;


//配置cell

/**
 配置cell

 @param cell cell
 @param model cell的model
 @param index index
 */
- (void)configCell:(UICollectionViewCell<HomeListCellProtocol> *)cell  withModel:(id<HomeCellModelProtocol>)model index:(NSInteger)index;


/**
 是否是heder

 @param index
 @return
 */
- (BOOL)isHeaderSection:(NSInteger)index;

/**
 是否是footer

 @param index
 @return 
 */
- (BOOL)isFooterSection:(NSInteger)index;

@end


NS_ASSUME_NONNULL_END
