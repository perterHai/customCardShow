//
//  EFTipCardAlertCollectionViewCell.m
//  CardShow
//
//  Created by 张海龙 on 16/11/10.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "EFTipCardAlertCollectionViewCell.h"

@interface EFTipCardAlertCollectionViewCell ()

@property (nonnull, nonatomic, strong) UIImageView *backImageView;
@property (nonnull, nonatomic, strong) UILabel *tipLabel;

@end

@implementation EFTipCardAlertCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews
{
    [self.contentView addSubview:self.backImageView];
    [self.contentView addSubview:self.tipLabel];
}

- (void)setModel:(EFTipCardAlertCollectionViewModel *)model
{
    _model = model;
    self.backImageView.image = [UIImage imageNamed:model.imageName];
    self.tipLabel.text = model.tipStr;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backImageView.frame = self.contentView.frame;
    self.tipLabel.frame = CGRectMake(0, 0, self.contentView.frame.size.width-20, 20);
    self.tipLabel.center = self.contentView.center;
}

- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]init];
    }
    return _backImageView;
}

-(UILabel *)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc]init];
        _tipLabel.font = [UIFont systemFontOfSize:13];
        _tipLabel.textColor = [UIColor blackColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tipLabel;
}

@end
