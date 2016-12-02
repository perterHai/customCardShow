//
//  ViewController.m
//  CardShow
//
//  Created by 张海龙 on 16/11/10.
//  Copyright © 2016年 张海龙. All rights reserved.
//

#import "ViewController.h"
#import "EFBtnTipCardAlert.h"
#import "EFPageCardAlert.h"
#import "EFTipCardAlertCollectionViewModel.h"

@interface ViewController ()

@property (nonatomic, strong) EFBtnTipCardAlert *tipCardAlert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpSubViews];
}

- (void)setUpSubViews
{
    UIButton *tipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tipBtn.frame = CGRectMake(100, self.view.frame.size.height/2-50, self.view.frame.size.width-200, 40);
    [tipBtn setTitle:@"弹有button框" forState:UIControlStateNormal];
    [tipBtn setBackgroundColor:[UIColor grayColor]];
    [tipBtn addTarget:self action:@selector(alertCard:) forControlEvents:UIControlEventTouchUpInside];
    tipBtn.tag = 1000;
    [self.view addSubview:tipBtn];
    
    UIButton *tipTwoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tipTwoBtn.frame = CGRectMake(100, CGRectGetMaxY(tipBtn.frame)+10, self.view.frame.size.width-200, 40);
    [tipTwoBtn setTitle:@"弹有pageControl框" forState:UIControlStateNormal];
    [tipTwoBtn setBackgroundColor:[UIColor grayColor]];
    [tipTwoBtn addTarget:self action:@selector(alertCard:) forControlEvents:UIControlEventTouchUpInside];
    tipTwoBtn.tag = 1001;
    [self.view addSubview:tipTwoBtn];
}

-(void)alertCard:(UIButton *)sender
{
    NSMutableArray *lastBtnArray = [[NSMutableArray alloc]initWithObjects:@"上一步",@"上一步",@"上一步", nil];
    NSMutableArray *nextBtnArray = [[NSMutableArray alloc]initWithObjects:@"下一步",@"下一步",@"完成", nil];
    EFTipCardAlertCollectionViewModel *mode = [[EFTipCardAlertCollectionViewModel alloc]init];
    mode.imageName = @"test";
    mode.tipStr = @"test1";
    EFTipCardAlertCollectionViewModel *mode2 = [[EFTipCardAlertCollectionViewModel alloc]init];
    mode2.imageName = @"test";
    mode2.tipStr = @"test2";
    EFTipCardAlertCollectionViewModel *mode3 = [[EFTipCardAlertCollectionViewModel alloc]init];
    mode3.imageName = @"test";
    mode3.tipStr = @"test3";
    NSMutableArray *contentArray = [[NSMutableArray alloc]initWithObjects:mode,mode2,mode3, nil];
    if (sender.tag == 1000) {
        self.tipCardAlert = [EFBtnTipCardAlert showTipCardAlertWithLatsBtn:lastBtnArray nextBtnArray:nextBtnArray contentArray:contentArray selectIndex:^(NSInteger selectIndex, BtnType btnType) {
            if (BtnType_Next == btnType) {
                if (selectIndex == 2) {
                    [self.tipCardAlert dismissCardAlert];
                    return ;
                }
                [self.tipCardAlert scrollToAnotherIndex:selectIndex+1];
            }
            else if (BtnType_Last)
            {
                [self.tipCardAlert scrollToAnotherIndex:selectIndex-1];
            }
        }];
//        self.tipCardAlert.scrollEnable = YES;
    }
    else
    {
        [EFPageCardAlert showTipCardAlertWithPage:contentArray];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
