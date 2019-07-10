//
//  FrashTools.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/30.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "FrashTools.h"

@implementation FrashTools
+ (CGFloat)TabbarHeight
{
    UITabBarController *tabc =(UITabBarController *) [UIApplication sharedApplication].keyWindow.rootViewController;
    return tabc.tabBar.bounds.size.height;
}

@end
