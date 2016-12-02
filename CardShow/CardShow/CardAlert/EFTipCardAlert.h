//
//  EFTipCardAlert.h
//  CardShow
//
//  Created by 张海龙 on 16/11/10.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EFTipCardAlert : UIView

//可以支持滑动控件是否手动滑动
@property (nonatomic, assign) BOOL scrollEnable;
//collectionView滑动显示数据
@property (nullable, nonatomic, strong) NSMutableArray *contentArray;
//当前选中的分页
@property (nonatomic, assign)NSInteger selectIndex;

//当前设置的页码背景颜色
@property (nonnull, nonatomic, strong) UIColor *pageColor;

//初始化cardalert beatClass:需要初始化的类
+ (nonnull instancetype)initCardAlertWithClass:(nonnull Class)beatClass;
//指定跳转到任何一个分页
- (BOOL)scrollToAnotherIndex:(NSInteger)index;

//当滑动时获取到当前的index
-(void)showScrollToIndex:(NSInteger)index;

//主动消失滑动控件
- (void)dismissCardAlert;

//加载子view
- (void)setUpSubViews;

@end
