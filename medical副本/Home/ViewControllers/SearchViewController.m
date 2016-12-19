//
//  SearchViewController.m
//  medical
//
//  Created by renmiantaohua on 16/12/7.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@property (nonatomic, strong) UITextField *searchText;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 0, 50, 25);
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(backHomeClicked) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:NSLocalizedString(@"Search_Cancel", nil) forState:UIControlStateNormal];
    UIBarButtonItem *cancelBtnItem = [[UIBarButtonItem alloc]initWithCustomView:cancelBtn];
    self.navigationItem.rightBarButtonItem = cancelBtnItem;
    
    [self initWithSearchView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.searchText.hidden = YES;
}

- (void)initWithSearchView {
    self.searchText = [[UITextField alloc]initWithFrame:CGRectMake(15, 10, Width-80, 25)];
    self.searchText.layer.masksToBounds = YES;
    self.searchText.layer.cornerRadius = 10;
    self.searchText.backgroundColor = [UIColor lightGrayColor];
    self.searchText.placeholder = NSLocalizedString(@"Home_SearchText", nil);
    self.searchText.returnKeyType = UIReturnKeySearch;
    [self.navigationController.navigationBar addSubview:self.searchText];
}

- (void)backHomeClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
