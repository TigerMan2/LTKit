//
//  TMBlockDemoController.m
//  TMKit
//
//  Created by Luther on 2020/6/8.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMBlockDemoController.h"

@interface TMBlockItem : NSObject
@property (nonatomic, strong, readonly) NSString *clsName;
@property (nonatomic, strong, readonly) NSString *desc;

- (instancetype)initWithClsName:(NSString *)clsName desc:(NSString *)desc;

@end

@implementation TMBlockItem

- (instancetype)initWithClsName:(NSString *)clsName desc:(NSString *)desc {
    if (self = [super init]) {
        _clsName = clsName;
        _desc = desc;
    }
    return self;
}

@end

@interface TMBlockDemoController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
{
    NSArray *_dataSources;
}
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TMBlockDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadData];
}

- (void)setupUI {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 44;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    [self.view addSubview:self.tableView];
}

- (void)loadData {
    _dataSources = @[
        [[TMBlockItem alloc] initWithClsName:@"TMAnimationController" desc:@"情况①:UIViewAnimationBlock"],
        [[TMBlockItem alloc] initWithClsName:@"TMNotificationController" desc:@"情况②:NSNotificationCenterBlock"],
        [[TMBlockItem alloc] initWithClsName:@"TMNotificationIvarController" desc:@"情况③:NSNotificationCenterIvarBlock"],
        [[TMBlockItem alloc] initWithClsName:@"TMGCDController" desc:@"情况④:GCDBlock"],
        [[TMBlockItem alloc] initWithClsName:@"TMOperationController" desc:@"情况⑤:NSOperationBlock"],
        [[TMBlockItem alloc] initWithClsName:@"TMOperationIvarController" desc:@"情况⑥:NSOperationIvarBlock"],
    ];
    [self.tableView reloadData];
}

#pragma mark  UITableViewDataSources & UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = [_dataSources[indexPath.row] desc];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *clsName = [_dataSources[indexPath.row] clsName];
    UIViewController *controller = [NSClassFromString(clsName) new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
