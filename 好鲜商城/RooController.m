//
//  RooController.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/28.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "RooController.h"
#import "MainViewController.h"
#import "ClassViewController.h"
#import "MoreViewController.h"
#import "UserInfoViewController.h"
#import "HomeViewController.h"
#import "shopCatVC.h"
#import "LoginViewController.h"
@interface RooController ()

@end

@implementation RooController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self  = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        
        [self setChildControllers];
        self.tabBar.backgroundColor = [UIColor whiteColor];
        self.tabBar.translucent  =NO ;
        
    }
    return self;
}


- (void)setChildControllers
{
    HomeViewController * mine  = [[HomeViewController alloc]init];
//    mine.view.backgroundColor = [UIColor orangeColor];
    [self addChildViewController:mine title:@"首页" selectImage:@"shouye" image:@"shouye_hui"];
    shopCatVC * more  = [[shopCatVC alloc]init];
//      more.view.backgroundColor = [UIColor cyanColor];
    [self addChildViewController:more title:@"购物车" selectImage:@"gouwuche" image:@"gouwuche_hui"];
    UserInfoViewController * user  = [[UserInfoViewController alloc]init];
//      user.view.backgroundColor = [UIColor darkGrayColor];
    [self addChildViewController:user title:@"我的" selectImage:@"mine" image:@"wode"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title selectImage:(NSString *)selectImage image:(NSString *)image
{
    //childController.view.backgroundColor = [UIColor colorWithRed:244 green:244 blue:244 alpha:1];//设置页面的颜色为随机色
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *selImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
   
    childController.tabBarItem.selectedImage = selImage;

    //改变字体颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#a4aab3"],NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateNormal];
    
    //选中状态颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#f26343"],NSFontAttributeName:[UIFont systemFontOfSize:12]} forState:UIControlStateSelected];
    UINavigationController  *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    
    
    
    [self addChildViewController:nav];
    
    //  添加一个自定义选项卡按钮
    //[self.customTabBar addTabBarButton:childVc.tabBarItem];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
