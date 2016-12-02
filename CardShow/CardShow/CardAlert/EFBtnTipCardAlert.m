//
//  EFBtnTipCardAlert.m
//  CardShow
//
//  Created by 张海龙 on 16/11/11.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "EFBtnTipCardAlert.h"

@interface EFBtnTipCardAlert ()

@property (nonnull, nonatomic, strong) UIButton *nextBtn;
@property (nonnull, nonatomic, strong) UIButton *lastBtn;


@property (nullable, nonatomic, strong) NSMutableArray *lastArray;
@property (nullable, nonatomic, strong) NSMutableArray *nextArray;

@end

@implementation EFBtnTipCardAlert

+ (instancetype)showTipCardAlertWithLatsBtn:(NSMutableArray *)lastBtnArray nextBtnArray:(NSMutableArray *)nextBtnArray contentArray:(NSMutableArray *)contentArray selectIndex:(showSelectIndex)callBack
{
    EFBtnTipCardAlert *tipCardAlert = (EFBtnTipCardAlert *)[self initCardAlertWithClass:[EFBtnTipCardAlert class]];
    tipCardAlert.pageColor = [UIColor grayColor];
    tipCardAlert.scrollEnable = NO;
    tipCardAlert.lastArray = lastBtnArray;
    tipCardAlert.nextArray = nextBtnArray;
    tipCardAlert.contentArray = contentArray;
    tipCardAlert.showIndex = callBack;
    [tipCardAlert setUpSubViews];
    return tipCardAlert;
}

- (void)setUpSubViews
{
    [super setUpSubViews];
    [self addSubview:self.nextBtn];
    [self addSubview:self.lastBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.lastBtn.frame = CGRectMake(0, CGRectGetHeight(self.frame)-30, self.frame.size.width/2, 30);
    self.nextBtn.frame = CGRectMake(self.frame.size.width/2, CGRectGetHeight(self.frame)-30, self.frame.size.width/2, 30);
}

- (void)nextScorll:(id)sender
{
    if (self.showIndex) {
        self.showIndex(self.selectIndex,BtnType_Next);
    }
}

- (void)lastScroll:(id)sender
{
    if (self.showIndex) {
        self.showIndex(self.selectIndex,BtnType_Last);
    }
}

- (BOOL)scrollToAnotherIndex:(NSInteger)index
{
    if (![super scrollToAnotherIndex:index]) {
        return NO;
    }
    [self.nextBtn setTitle:[self.nextArray objectAtIndex:index] forState:UIControlStateNormal];
    [self.lastBtn setTitle:[self.lastArray objectAtIndex:index] forState:UIControlStateNormal];
    return YES;
}

- (void)showScrollToIndex:(NSInteger)index
{
    [super showScrollToIndex:index];
    [self scrollToAnotherIndex:index];
}

-(void)setLastArray:(NSMutableArray *)lastArray
{
    _lastArray = lastArray;
    if (lastArray != nil) {
        [self.lastBtn setTitle:[lastArray objectAtIndex:0] forState:UIControlStateNormal];
    }
}

-(void)setNextArray:(NSMutableArray *)nextArray
{
    _nextArray = nextArray;
    if (nextArray != nil) {
        [self.nextBtn setTitle:[nextArray objectAtIndex:0] forState:UIControlStateNormal];
    }
}

- (void)setLastBtnImage:(UIImage *)lastBtnImage
{
    _lastBtnImage = lastBtnImage;
    [self.lastBtn setImage:lastBtnImage forState:UIControlStateNormal];
}

- (void)setNextBtnImage:(UIImage *)nextBtnImage
{
    _nextBtnImage = nextBtnImage;
    [self.nextBtn setImage:nextBtnImage forState:UIControlStateNormal];
}

-(UIButton *)nextBtn
{
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(nextScorll:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBtn;
}

-(UIButton *)lastBtn
{
    if (!_lastBtn) {
        _lastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lastBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_lastBtn addTarget:self action:@selector(lastScroll:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lastBtn;
}

@end
