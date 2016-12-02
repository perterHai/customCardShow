//
//  EFCollectionLayout.m
//  CardShow
//
//  Created by 张海龙 on 16/11/10.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "EFCollectionLayout.h"

@interface EFCollectionLayout ()

@property (nonatomic, assign) CGPoint oldPoint;

@end

@implementation EFCollectionLayout

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    if (self.oldPoint.x > proposedContentOffset.x) {
        NSLog(@"向右滑动->");
        CGPoint point = CGPointMake(self.oldPoint.x -self.width, 0);
        self.oldPoint = point;
    }
    else
    {
        NSLog(@"向左滑动<- %f,%f",proposedContentOffset.x,self.oldPoint.x);
        if (proposedContentOffset.x ==self.oldPoint.x) {
            return self.oldPoint;
        }
        self.oldPoint = CGPointMake(self.oldPoint.x+self.width, 0);
    }
    if ([self.delegate respondsToSelector:@selector(showScrollToIndex:)]) {
        NSInteger index = self.oldPoint.x/self.width;
        [self.delegate showScrollToIndex:index];
    }
    return self.oldPoint;
}

@end
