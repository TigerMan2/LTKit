//
//  TMAnimationViewController.m
//  TMKit
//
//  Created by Luther on 2020/3/31.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMAnimationViewController.h"
#import "TMButtonPressViewController.h"

@interface TMItem : NSObject
@property (nonatomic, strong) id object;
@property (nonatomic, copy) NSString *name;
@end

@implementation TMItem

+ (instancetype)itemWithObject:(id)object name:(NSString *)name {
    TMItem *item = [[TMItem alloc] init];
    item.object = object;
    item.name = name;
    return item;
}

@end

static NSString *const TMAnimationCellIdentifier = @"TMAnimationCellIdentifier";

@interface TMAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSources;
@end

@implementation TMAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 50;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TMAnimationCellIdentifier];
    [self.view addSubview:self.tableView];
    
    self.dataSources = @[
        [TMItem itemWithObject:[TMButtonPressViewController class] name:@"POP-Stroke动画"]
    ];
}

#pragma mark  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TMAnimationCellIdentifier];
    TMItem *item = self.dataSources[indexPath.row];
    cell.textLabel.text = item.name;
    cell.textLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.65f];
    cell.textLabel.font = [UIFont fontWithName:@"GillSans-Italic" size:16.f];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TMItem *item = self.dataSources[indexPath.row];
    UIViewController *controller = [item.object new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
