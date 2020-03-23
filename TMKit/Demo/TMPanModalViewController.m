//
//  TMPanModalViewController.m
//  TMKit
//
//  Created by Luther on 2020/3/23.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMPanModalViewController.h"

@interface TMPanModalViewController () <UITableViewDelegate,UITableViewDataSource,HWPanModalPresentable>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *listItems;
@end

@implementation TMPanModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}

- (void)setupSubviews {
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    
    NSString *text = @"Downstairs, the doctor left three different medicines in different colored capsules2 with instructions for giving them. One was to bring down the fever, another purgative3, the third to overcome an acid condition. The germs of influenza4 can only exist in an acid condition, he explained. He seemed to know all about influenza and said there was nothing to worry about if the fever did not go above one hundred and four degree. This was a light epidemic5 of flu and there was no danger if you avoided pneumonia6.\n"
                     "Back in the room I wrote the boy's temperature down and made a note of the time to give the various capsules.";
    for (int i = 0; i < 20; ++i) {
        NSString *subText = [text substringToIndex:arc4random() % text.length];
        [self.listItems addObject:subText];
    }
    [self.tableView reloadData];
}

#pragma mark  HWPanModalPresentable
- (CGFloat)topOffset {
    return 64;
}

- (UIScrollView *)panScrollable {
    return self.tableView;
}

- (BOOL)showDragIndicator {
    return NO;
}

- (PanModalHeight)shortFormHeight {
    return PanModalHeightMake(PanModalHeightTypeContent, 400);
}

- (PanModalHeight)longFormHeight {
    return PanModalHeightMake(PanModalHeightTypeMaxTopInset, 0);
}

#pragma mark  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = self.listItems[indexPath.row];
    return cell;
}

- (NSMutableArray *)listItems {
    if (!_listItems) {
        _listItems = [NSMutableArray array];
    }
    return _listItems;
}

@end
