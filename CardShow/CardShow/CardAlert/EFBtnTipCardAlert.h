//
//  EFBtnTipCardAlert.h
//  CardShow
//
//  Created by 张海龙 on 16/11/11.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "EFTipCardAlert.h"

typedef NS_ENUM(NSInteger, BtnType)
{
    BtnType_Next = 1,
    BtnType_Last,
};
typedef void (^showSelectIndex) (NSInteger selectIndex,BtnType btnType);

@interface EFBtnTipCardAlert : EFTipCardAlert

@property (nullable, nonatomic, copy) showSelectIndex showIndex;
//左边btn的背景图片
@property (nonnull, nonatomic, strong) UIImage *lastBtnImage;
//右边btn的背景图片
@property (nonnull, nonatomic, strong) UIImage *nextBtnImage;

//显示底部带button的滑动控件
+ (nonnull instancetype)showTipCardAlertWithLatsBtn:(nonnull NSMutableArray *)lastBtnArray nextBtnArray:(nonnull NSMutableArray *)nextBtnArray contentArray:(nonnull NSMutableArray *)contentArray selectIndex:(nullable showSelectIndex)callBack;

@end
