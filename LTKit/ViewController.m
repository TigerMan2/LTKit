//
//  ViewController.m
//  LTKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+LTExtension.h"
#import "UIView+LTExtension.h"
#import "UIButton+LTBadge.h"
#import "UIButton+LTExtension.h"
#import "UIButton+LTCountDown.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *centerBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.center = self.view.center;
//    [button setTitle:@"测试" forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button];
    
//    [button setImagePosition:LTImagePositionTop spacing:10];
    [button startCountDownWithDefaultTitle:@"提交" totalTime:10 timeUnit:@"s"];
    button.badgeValue = @"20";
    self.centerBtn = button;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSInteger badgeValue = [self.centerBtn.badgeValue integerValue];
    badgeValue ++;
    self.centerBtn.badgeValue = [NSString stringWithFormat:@"%ld",(long)badgeValue];
}

@end
