//
//  EFPageCardAlert.m
//  CardShow
//
//  Created by 张海龙 on 16/11/11.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "EFPageCardAlert.h"

@interface EFPageCardAlert ()

@property (nonnull, nonatomic, strong) UIPageControl *pageControl;
@property (nonnull, nonatomic, strong) UIButton *closeBtn;

@end

@implementation EFPageCardAlert

+ (instancetype)showTipCardAlertWithPage:(NSMutableArray *)contentArray
{
    EFPageCardAlert *tipCardAlert = (EFPageCardAlert *)[self initCardAlertWithClass:[EFPageCardAlert class]];
    tipCardAlert.scrollEnable = YES;
    tipCardAlert.contentArray = contentArray;
    [tipCardAlert setUpSubViews];
    return tipCardAlert;
}

- (void)setUpSubViews
{
    [super setUpSubViews];
    [self addSubview:self.pageControl];
    [self addSubview:self.closeBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.pageControl.frame = CGRectMake(0, CGRectGetHeight(self.frame)-20, self.frame.size.width, 10);
    self.closeBtn.frame = CGRectMake(CGRectGetWidth(self.frame)-40,5 , 40, 15);
}

- (void)showScrollToIndex:(NSInteger)index
{
    [super showScrollToIndex:index];
    self.pageControl.currentPage = index;
}

- (void)close:(id)sender
{
    [self dismissCardAlert];
}

- (void)setShowPageControl:(BOOL)showPageControl
{
    _showPageControl = showPageControl;
    self.pageControl.hidden = showPageControl;
}

- (void)setSelectPageControlColor:(UIColor *)selectPageControlColor
{
    _selectPageControlColor = selectPageControlColor;
    self.pageControl.currentPageIndicatorTintColor = selectPageControlColor;
}

- (void)setNormalPageControlColor:(UIColor *)normalPageControlColor
{
    _normalPageControlColor = normalPageControlColor;
    self.pageControl.pageIndicatorTintColor = normalPageControlColor;
}

-(UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = self.contentArray.count;
        _pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.enabled = NO;
    }
    return _pageControl;
}

-(UIButton *)closeBtn
{
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

@end
