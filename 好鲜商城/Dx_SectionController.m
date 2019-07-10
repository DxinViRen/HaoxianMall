//
//  Dx_SectionController.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/28.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "Dx_SectionController.h"
#import "NSArray+Adpa.h"
#import "HomeSectionHFCell.h"
@implementation Dx_SectionController
- (BOOL)isHeaderSection:(NSInteger)index
{
    return index == 0;
}

- (BOOL)isFooterSection:(NSInteger)index
{
    return index == self.object.dataArray.count + 1;
}

- (NSString *)cellInferfierWithModel:(id<HomeCellModelProtocol>)model
{
    if([model respondsToSelector:@selector(cellInderfier)])
    {
        if(model.cellInderfier.length>0)
        {
            return model.cellInderfier;
        }
    }
    
    return model.cellName;
}

- (void)configCell:(UICollectionViewCell<HomeListCellProtocol> *)cell withModel:(id<HomeCellModelProtocol>)model index:(NSInteger)index
{
    if(self.configCellBlock)
    {
        self.configCellBlock(model, index - 1, cell);
    }
    
    cell.model = model;
}

- (NSInteger)numberOfItems
{
    return self.object.dataArray.count == 0? 0:self.object.dataArray.count + 2;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index
{
    if([self isHeaderSection:index])
    {
        return CGSizeMake(self.collectionContext.containerSize.width, self.object.headerModel.sepotHeight);
    }
    
    if([self isFooterSection:index])
    {
        return CGSizeMake(self.collectionContext.containerSize.width, self.object.footModel.sepotHeight);
    }
    id<HomeCellModelProtocol>model = [self.object.dataArray  dx_objectAtIndex:index - 1];
   
    if([model respondsToSelector:@selector(cellHeight)])
    {
        return CGSizeMake(model.cellWight, model.cellHeight);
    }

    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}



- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index
{
    //因为默认设置了Header和Footer所以需要特殊处理
    if([self isHeaderSection:index]||[self isFooterSection:index])
    {
        HomeSectionHFCell *cell = [self.collectionContext dequeueReusableCellOfClass:[HomeSectionHFCell class] forSectionController:self atIndex:index];
        return cell;
    }
    
    id<HomeCellModelProtocol> model = [self.object.dataArray dx_objectAtIndex:index -1];
    NSString *cellIndefier = model.cellInderfier;
    UICollectionViewCell<HomeListCellProtocol> *cell = [self.collectionContext dequeueReusableCellOfClass:NSClassFromString(model.cellName) withReuseIdentifier:cellIndefier forSectionController:self atIndex:index];
    [self configCell:cell withModel:model index:index];
    return cell;
}

- (void)didUpdateToObject:(id)object
{
    self.object = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index
{
    if(![self isHeaderSection:index]&&![self isFooterSection:index])
    {
        if(self.cellDidClickBlock)
        {
            self.cellDidClickBlock([self.object.dataArray dx_objectAtIndex:index - 1], index - 1);
        }
    }
}

@end
