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
#import "LTHeader.h"
#import "LTPagerViewDemoCell.h"

@interface ViewController ()
<
    LTCyclePagerViewDelegate,
    LTCyclePagerViewDataSource
>
@property (nonatomic, strong) LTCyclePagerView *pagerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.pagerView];
    [self.pagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.left.right.equalTo(@(0));
        make.height.equalTo(@(188));
    }];
    
    [self.pagerView reloadData];

}

#pragma mark  LTCyclePagerViewDataSource
- (NSInteger)numberOfItemsInPagerView:(LTCyclePagerView *)pagerView {
    return 6;
}

- (UICollectionViewCell *)pagerView:(LTCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    LTPagerViewDemoCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"LTPagerViewDemoCell" forIndex:index];
    NSArray *imgs = @[@"https://dexunzhenggu.oss-cn-shenzhen.aliyuncs.com/dx_web/file_1565677866737.jpg",
    @"https://dexunzhenggu.oss-cn-shenzhen.aliyuncs.com/dx_web/file_1566524871843.jpg",
    @"https://dexunzhenggu.oss-cn-shenzhen.aliyuncs.com/dx_web/file_1566714237783.jpg",
    @"https://dexunzhenggu.oss-cn-shenzhen.aliyuncs.com/dx_web/file_1572504625820.png",
    @"https://dexunzhenggu.oss-cn-shenzhen.aliyuncs.com/dx_web/file_1572504632430.png",
    @"https://dexunzhenggu.oss-cn-shenzhen.aliyuncs.com/dx_web/file_1572504639466.png"];
    [cell.imageView sd_setImageWithURL:imgs[index]];
    return cell;
}

- (LTCyclePagerViewLayout *)layoutForPagerView:(LTCyclePagerView *)pagerView {
    LTCyclePagerViewLayout *layout = [[LTCyclePagerViewLayout alloc] init];
    layout.itemSize = CGSizeMake(315, 188);
    layout.itemSpacing = 15;
    return layout;
}

#pragma mark  getter

- (LTCyclePagerView *)pagerView {
    if (!_pagerView) {
        _pagerView = [[LTCyclePagerView alloc] init];
        _pagerView.isInfiniteLoop = YES;
        _pagerView.autoScrollInterval = 3.0;
        _pagerView.delegate = self;
        _pagerView.dataSource = self;
        [_pagerView registerClass:[LTPagerViewDemoCell class] forCellWithReuseIdentifier:@"LTPagerViewDemoCell"];
    }
    return _pagerView;
}

@end
