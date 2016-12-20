//
//  MyViewController.m
//  medical
//
//  Created by renmiantaohua on 16/12/6.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "MyViewController.h"
#import "MyHeaderView.h"
#import "CExpandHeader.h"
#import "MyInfoViewController.h"

@interface MyViewController ()<MyInfoDelegate>

@property (nonatomic ,strong) CExpandHeader *header;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    MyHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"MyHeaderView" owner:nil options:nil] firstObject];
    headerView.delegate = self;
    headerView.frame = CGRectMake(0, 0, Width, 180);
    self.header = [CExpandHeader expandWithScrollView:self.tableView expandView:headerView];
    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [self.tableView setSectionFooterHeight:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - MyInfoDelegate

- (void)myInfoClicked:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MyInfo" bundle:nil];
    MyInfoViewController *myInfoVC = [storyboard instantiateViewControllerWithIdentifier:@"MyInfoViewController"];
    myInfoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:myInfoVC animated:YES];
    
}

@end
