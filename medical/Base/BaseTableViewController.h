//
//  BaseTableViewController.h
//  medical
//
//  Created by renmiantaohua on 16/12/6.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController

/**
 *  刷新时page
 */
@property (nonatomic, assign) NSInteger num;

/**
 *  数据源
 */
@property (strong, nonatomic) NSMutableArray *dataSource;

/**
 *  下拉刷新
 *
 *  @param scrollView  UITableView & UICollectionView
 *  @param headerBlock 刷新时候的回调
 */
- (void)headerWithRefreshing:(UIScrollView *)scrollView callBack:(dispatch_block_t)headerBlock;
/**
 *  上拉加载
 *
 *  @param scrollView  UITableView & UICollectionView
 *  @param footerBlock 刷新时候的回调
 */
- (void)footerWithRefreshing:(UIScrollView *)scrollView callBack:(dispatch_block_t)footerBlock;

@end
