//
//  ViewController.m
//  LTKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "NSURLRequest+LTParams.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *centerBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array = [NSURLRequest queryStringComponentsFromKey:@"key" value:@[@"version",@"sss",@"aaa"]];
    NSLog(@"array-----%@",array);
    
}


@end
