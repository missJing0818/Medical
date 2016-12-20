//
//  BaseTableViewController.m
//  medical
//
//  Created by renmiantaohua on 16/12/6.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MJRefresh.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (NSInteger)num {
    if (!_num) {
        _num = 1;
    }
    return _num;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)headerWithRefreshing:(UIScrollView *)scrollView callBack:(dispatch_block_t)headerBlock {
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (headerBlock) {
            headerBlock();
        }
    }];
}

- (void)footerWithRefreshing:(UIScrollView *)scrollView callBack:(dispatch_block_t)footerBlock {
  scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
      if (footerBlock) {
          footerBlock();
      }
  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
