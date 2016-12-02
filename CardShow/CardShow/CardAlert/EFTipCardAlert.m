//
//  EFTipCardAlert.m
//  CardShow
//
//  Created by 张海龙 on 16/11/10.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "EFTipCardAlert.h"
#import "EFCollectionLayout.h"
#import "EFTipCardAlertCollectionViewCell.h"

@interface EFTipCardAlert ()<UICollectionViewDelegate,UICollectionViewDataSource,EFCollectionLayoutDelegate>

@property (nonnull, nonatomic, strong) UICollectionView *tipCardCollection;
@property (nonnull, nonatomic, strong) EFCollectionLayout *scrollLayout;

@end

@implementation EFTipCardAlert

+ (instancetype)initCardAlertWithClass:(Class)beatClass
{
    id tipCardAlert = [[beatClass alloc]initWithFrame:CGRectMake(0, 0, 200, 300)];
    [tipCardAlert setCenter:[UIApplication sharedApplication].keyWindow.center];
    return tipCardAlert;
}

- (void)setUpSubViews
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.tipCardCollection];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self showAnimation];
}

- (void)showAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05, 1.05, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)]];
    animation.keyTimes = @[ @0, @0.5, @1 ];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = 0.3;
    [self.layer addAnimation:animation forKey:@"showTipAlert"];
}

- (BOOL)scrollToAnotherIndex:(NSInteger)index
{
    if (index >= self.contentArray.count) {
        return NO;
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tipCardCollection scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    self.selectIndex = index;
    return YES;
}

- (void)dismissCardAlert
{
    [self removeFromSuperview];
}

#pragma make - EFCollectionLayoutDelegate

-(void)showScrollToIndex:(NSInteger)index
{
    self.selectIndex = index;
}

#pragma makr - uicollection delegate
-(NSInteger)numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.contentArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EFTipCardAlertCollectionViewCell * tipCardCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    tipCardCell.model = [self.contentArray objectAtIndex:indexPath.row];
    tipCardCell.backgroundColor = self.pageColor;
    return tipCardCell;
}

-(void)setScrollEnable:(BOOL)scrollEnable
{
    _scrollEnable = scrollEnable;
    self.tipCardCollection.scrollEnabled = scrollEnable;
}

- (void)setContentArray:(NSMutableArray *)contentArray
{
    _contentArray = contentArray;
    [self.tipCardCollection reloadData];
}

- (void)setPageColor:(UIColor *)pageColor
{
    _pageColor = pageColor;
    [self.tipCardCollection reloadData];
}

-(EFCollectionLayout *)scrollLayout
{
    if (!_scrollLayout) {
        _scrollLayout = [[EFCollectionLayout alloc]init];
        _scrollLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _scrollLayout.itemSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        _scrollLayout.minimumLineSpacing = 0;
        _scrollLayout.width = self.frame.size.width;
        _scrollLayout.delegate = self;
    }
    return _scrollLayout;
}

-(UICollectionView *)tipCardCollection
{
    if (!_tipCardCollection) {
        _tipCardCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout:self.scrollLayout];
        _tipCardCollection.delegate = self;
        _tipCardCollection.dataSource = self;
        [_tipCardCollection registerClass:[EFTipCardAlertCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
        _tipCardCollection.pagingEnabled = YES;
        _tipCardCollection.showsHorizontalScrollIndicator = NO;
        _tipCardCollection.backgroundColor = [UIColor whiteColor];
    }
    return _tipCardCollection;
}

@end
