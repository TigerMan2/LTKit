//
//  ViewController.m
//  LTKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "NSURLRequest+LTParams.h"
#import "NSDictionary+LT.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *centerBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *urlString = @"https://service.agent.dexunzhenggu.cn/index.php?c=Answer&a=userhistory&site=stockdoctor&v=company&admin_id=1565&appId=ios&appcode=5c3d73a0f1f18c30cqb5zkov&client_id=211C918D-6042-CAE5-B9A9-668E01393FAA&company_id=2&curpage=1&datastatus=3&key=5dd4a57336c13r43dm2jvw3i&pagesize=10&serviceversion=v2&vcode=1&ver=1.0.0";
    NSDictionary *dic = [NSDictionary dictionaryWithURLQuery:urlString];
    NSLog(@"dic---%@",dic);
    
    NSString *url = [dic URLQueryString];
    NSLog(@"url---%@",url);
    
}


@end
