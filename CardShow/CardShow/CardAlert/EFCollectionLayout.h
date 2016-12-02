//
//  EFCollectionLayout.h
//  CardShow
//
//  Created by 张海龙 on 16/11/10.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EFCollectionLayoutDelegate;

@interface EFCollectionLayout : UICollectionViewFlowLayout

@property (nonatomic, assign)CGFloat width;
@property (nonatomic, weak) id<EFCollectionLayoutDelegate>delegate;

@end

@protocol EFCollectionLayoutDelegate <NSObject>

- (void)showScrollToIndex:(NSInteger)index;

@end
