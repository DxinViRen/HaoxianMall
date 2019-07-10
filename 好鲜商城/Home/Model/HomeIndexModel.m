//
//  HomeIndexModel.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "HomeIndexModel.h"
#import "Dx_SectionController.h"
#import "HomeBannerCell.h"
#import "HomeMenuCell.h"
#import "HoScrollCell.h"
#import "HomeSCHeadCell.h"
@implementation HomeIndexModel
+ (NSMutableArray *)createDataArray
{
    HomeCellModel *bannerModel = [[HomeCellModel alloc] init];
    bannerModel.cellName = NSStringFromClass([HomeBannerCell class]);
    NSMutableArray *imageArray = [NSMutableArray arrayWithObjects:@"http://ww1.sinaimg.cn/large/006tNc79ly1g4kbyzi6cmj30dw095jrw.jpg",@"http://ww1.sinaimg.cn/large/006tNc79ly1g4kbzybfopj30dw099mxw.jpg",@"http://ww2.sinaimg.cn/large/006tNc79ly1g4kc07kyjpj30dw091ab0.jpg",@"http://ww4.sinaimg.cn/large/006tNc79ly1g4kc0grdv4j30dw0990t1.jpg", nil];
    NSMutableArray *titleArray = [NSMutableArray arrayWithObjects:@"上等新鲜蔬菜给你健康生活",@"时令新鲜果蔬赔本甩卖",@"特价水果等你来抢购",@"新鲜白菜清仓处理", nil];
    bannerModel.extra =[NSMutableDictionary dictionaryWithObjectsAndKeys:imageArray,kHomeBannerArrayKey,titleArray,kHomeBannerTitlekey, nil];
    bannerModel.cellHeight = 200.0f;
    
    HomeCellModel *headSCSCrollModel  = [[HomeCellModel alloc]init];
    headSCSCrollModel.cellName = NSStringFromClass([HomeSCHeadCell class]);
    headSCSCrollModel.cellHeight = 50.0f;
    headSCSCrollModel.extra = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"今日特价",kHomeSectionHeaderDtitle ,nil];
    
    
    HomeCellModel *mUMOdle = [[HomeCellModel alloc]init];
    mUMOdle.cellName = NSStringFromClass([HomeMenuCell class]);
    NSArray *arr = [@[
  @{@"img":@"xinxianshuiguo",@"text":@"新鲜水果"},
  @{@"img":@"xinxianshucai",@"text":@"新鲜蔬菜"},
  @{@"img":@"xianshidaze",@"text":@"限时打折"},
  @{@"img":@"tejiashuiguo",@"text":@"特价水果"}]  mutableCopy];
    mUMOdle.extra =[NSMutableDictionary dictionaryWithObjectsAndKeys:arr,kHomeMenuItemTitleArray, nil];
    mUMOdle.cellHeight =400.0;
    
    
    HomeCellModel *headSCSCrollModel1  = [[HomeCellModel alloc]init];
    headSCSCrollModel1.cellName = NSStringFromClass([HomeSCHeadCell class]);
    headSCSCrollModel1.cellHeight = 50.0f;
    headSCSCrollModel1.extra = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"随你挑选",kHomeSectionHeaderDtitle ,nil];
    
    
    HomeCellModel *hModel = [[HomeCellModel alloc]init];
    hModel.cellName  = NSStringFromClass([HoScrollCell class]);
    NSMutableArray *imgArr = [@[@"dasuan",@"nangua",@"hongshu",@"shizi",@"lajiao",@"qiezi"] mutableCopy];
    hModel.extra = [NSMutableDictionary dictionaryWithObjectsAndKeys:imgArr,kHomeSCImageArrayKey, nil];
    hModel.cellHeight = 100;
    
    NSMutableArray *modeA = [NSMutableArray arrayWithObjects:bannerModel,headSCSCrollModel,hModel ,headSCSCrollModel1,mUMOdle, nil];
    SectionSeporModel *sectionM = [[SectionSeporModel alloc]initWithArray:modeA];
    sectionM.headerModel.sepotHeight = 0;
    return [NSMutableArray arrayWithObjects:sectionM, nil];
}
@end
