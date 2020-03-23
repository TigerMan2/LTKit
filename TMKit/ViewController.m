//
//  ViewController.m
//  TMKit
//
//  Created by Luther on 2019/6/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "TMTranslationMainViewController.h"
#import "TMDragViewController.h"
#import "TMWebViewController.h"
#import "TMPanModalViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSources;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubviews];
}

- (void)setupSubviews {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    tableView.rowHeight = 44;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = self.dataSources[indexPath.row];
    return cell;
}

#pragma mark  UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            TMTranslationMainViewController *mainVC = [[TMTranslationMainViewController alloc] init];
            [self.navigationController pushViewController:mainVC animated:YES];
        }
            break;
        case 1:
        {
            TMDragViewController *dragVC = [[TMDragViewController alloc] init];
            [self.navigationController pushViewController:dragVC animated:YES];
        }
            break;
        case 2:
        {
            UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            TMWebViewController *webVC = [board instantiateViewControllerWithIdentifier:@"TMWebViewController"];
            [self.navigationController pushViewController:webVC animated:YES];
        }
            break;
        case 3:
        {
            TMPanModalViewController *modalVC = [[TMPanModalViewController alloc] init];
            [self presentPanModal:modalVC];
        }
            break;
    }
}

- (NSArray *)dataSources {
    if (!_dataSources) {
        _dataSources = @[@"TMTranslation",@"TMDrag",@"TMWeb",@"TMPanModal"];
    }
    return _dataSources;
}

@end
