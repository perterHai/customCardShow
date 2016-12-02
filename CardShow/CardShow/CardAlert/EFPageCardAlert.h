//
//  EFPageCardAlert.h
//  CardShow
//
//  Created by 张海龙 on 16/11/11.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "EFTipCardAlert.h"

@interface EFPageCardAlert : EFTipCardAlert

//是否显示pagecontrol
@property (nonatomic, assign) BOOL showPageControl;
//选中态pagecontrol的小点颜色
@property (nullable, nonatomic, strong) UIColor *selectPageControlColor;
//非选中态pagecontrol的小点颜色
@property (nullable, nonatomic, strong) UIColor *normalPageControlColor;

//显示带pagecontrol的滑动控件
+ (nonnull instancetype)showTipCardAlertWithPage:(nonnull NSMutableArray *)contentArray;

@end
