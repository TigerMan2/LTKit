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
#import "BlocksKit.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *centerBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = @"请输入内容";
    [self.view addSubview:textField];
    
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor colorWithHexString:@"0xE50010"];
    NSLog(@"%@",[UIColor colorWithHexString:@"0xE50010"]);
    [self.view addSubview:label];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@(0));
        make.height.equalTo(@(40));
        make.top.equalTo(@(100));
        make.width.equalTo(@(300));
    }];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).offset(20);
        make.left.equalTo(textField.mas_left);
    }];
    
    RAC(label,text) = textField.rac_textSignal;
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
