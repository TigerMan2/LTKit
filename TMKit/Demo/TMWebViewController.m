//
//  TMWebViewController.m
//  TMKit
//
//  Created by Luther on 2020/3/19.
//  Copyright © 2020 mrstock. All rights reserved.
//

#import "TMWebViewController.h"
#import "AXWebViewController.h"

@interface TMWebViewController ()

@end

@implementation TMWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:@"http://www.baidu.com"];
                [self.navigationController pushViewController:webVC animated:YES];
            }
            break;
        case 1:
            {
                
            }
            break;
        case 2:
            {
                
            }
            break;
            
        default:
            break;
    }
}

@end
