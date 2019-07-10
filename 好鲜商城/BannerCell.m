//
//  BannerCell.m
//  好鲜商城
//
//  Created by D.xin on 2019/6/28.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "BannerCell.h"

@implementation BannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@""];
}



@end
