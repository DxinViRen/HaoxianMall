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
#import "GoodLIstItemCell.h"
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
  @{@"img":@"xinxianshuiguohjhj",@"text":@"新鲜水果"},
  @{@"img":@"xinxianshucai",@"text":@"新鲜蔬菜"},
  @{@"img":@"xianshidaze",@"text":@"限时打折"},
  @{@"img":@"tejiashuiguo",@"text":@"特价水果"}]  mutableCopy];
    mUMOdle.extra =[NSMutableDictionary dictionaryWithObjectsAndKeys:arr,kHomeMenuItemTitleArray, nil];
    mUMOdle.cellHeight =300.0;
    
    
    HomeCellModel *headSCSCrollModel1  = [[HomeCellModel alloc]init];
    headSCSCrollModel1.cellName = NSStringFromClass([HomeSCHeadCell class]);
    headSCSCrollModel1.cellHeight = 50.0f;
    headSCSCrollModel1.extra = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"随你挑选",kHomeSectionHeaderDtitle ,nil];
    
    
    NSMutableArray *imgArr = [@[@"dasuan",@"nangua",@"hongshu",@"shizi",@"lajiao",@"qiezi"] mutableCopy];
    NSArray *nameArr = @[@"新鲜的大蒜啊，价格合适，欢迎购买",@"南瓜好吃，还可以用来当面具哦",@"当官不为民做主，不如回家卖红薯的红薯",@"熟透了的柿子，是真的好吃柿子",@"霸道辣椒辣椒，红透半边天，辣到怀疑人生",@"紫色茄子红烧茄子"];
     NSArray *deArr = @[@"大蒜营养成分相当的丰富，而且还具有很好的食疗以及药用价值。大蒜鳞茎中含有丰富的蛋白质、低聚糖和多糖类、另外还有脂肪、矿物质等。100g新鲜大蒜含蛋白质为4.4g、脂肪为0.2g、碳水化合物为23g、粗纤维为0.7g、灰分为1.3g。大蒜中还含有丰富的含硫化合物，其中大蒜素具有杀菌、抑菌、抗癌、抗衰老等医疗保健功能。",@"多糖类：南瓜多糖是一种非特异性免疫增强剂，能提高机体免疫南瓜功能，促进细胞因子生成，通过活化补体等途径对免疫系统发挥多方面的调节功能。类胡萝卜素：南瓜中丰富的类胡萝卜素在机体内可转化成具有重要生理功能的维生素A，从而对上皮组织的生长分化、维持正常视觉、促进骨骼的发育具有重要生理功能。",@"番薯是一种营养齐全而丰富的天然滋补食品，富含蛋白质、脂肪、多糖、磷、钙、钾、胡萝卜素、维生素A、维生素C、维生素E、维生素B1、维生素B2和8种氨基酸。据科学家分析，其蛋白质的含量超过大米的7倍；胡萝卜素的含量是胡萝卜的3.5倍；维生素A的含量是马铃薯的100倍；糖、钙和维生素B1、维生素B2的含量皆高出大米和面粉。每100g鲜薯块可食部分含碳水化合物29.5g，脂肪0.2g，磷20g，钙18g，铁0.4g。这些物质，对促进人的脑细胞和分泌激素的活性，增强人体抗病能力，提高免疫功能，延缓智力衰退和机体衰老起着重要作用",@"柿果实营养丰富，被誉为“果中圣品”。在成熟新鲜果实中，每100g果肉中含有0.16mg维生素A、16mg维生素C、9mg钙、20mg磷以及0.2mg铁，其中胡萝卜素占据维生素A的大部分含量。柿子富含果胶，它是一种水溶性的膳食纤维，可以纠正便秘，调节肠道菌群组成，具有良好的润肠通便作用",@"每百克辣椒维生素C含量高达198毫克，居蔬菜之首位。维生素B、胡萝卜素以及钙、铁等矿物质含量亦较丰富。医药专家认为，辣椒能缓解胸腹冷痛，制止痢疾，杀抑胃腹内寄生虫，控制心脏病及冠状动脉硬化；还能刺激口腔黏膜，引起胃的蠕动，促进唾液分泌，增强食欲，促进消化。",@"营养价值⒈茄子的营养丰富，含有蛋白质、脂肪、碳水化合物、维生素以及钙、磷、铁等多种营养成分。⒉茄子中维生素P的含量很高，每100克中即含维生素P750毫克。能增强人体细胞间的黏着力，增强毛细血管的弹性，减低脆性及渗透性，防止微血管破裂出血"];
    NSMutableArray *mA = [@[] mutableCopy];
    for (int i = 0; i <imgArr.count; i ++) {
        GooddModel *hModel = [[GooddModel alloc]init];
        hModel.cellName  = NSStringFromClass([GoodLIstItemCell class]);
        hModel.imageName = imgArr[i];
        hModel.goodName  = nameArr[i];
        hModel.goodDetail = deArr[i];
        hModel.goodPrNum = [NSString stringWithFormat:@"%u",(arc4random()%10+30)];
        hModel.cellHeight = 100;
        hModel.praice = [NSString stringWithFormat:@"%u",(arc4random()%10+20)];
        [mA addObject:hModel];
    }
    
    
    NSMutableArray *modeA = [NSMutableArray arrayWithObjects:bannerModel,headSCSCrollModel1,mUMOdle, headSCSCrollModel,nil];
    SectionSeporModel *sectionM = [[SectionSeporModel alloc]initWithArray:modeA];
    SectionSeporModel *secM= [[SectionSeporModel alloc]initWithArray:mA];
    sectionM.headerModel.sepotHeight = 0;
    return [NSMutableArray arrayWithObjects:sectionM,secM,nil];
}
@end
