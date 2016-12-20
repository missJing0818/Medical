//
//  FindDoctorViewController.m
//  medical
//
//  Created by renmiantaohua on 16/12/10.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "FindDoctorViewController.h"
#import "DoctotListCell.h"

@interface FindDoctorViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITextField *searchText;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FindDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 45, Width, Height-45)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 0, 50, 25);
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(backHomeClicked) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:NSLocalizedString(@"Search_Back", nil) forState:UIControlStateNormal];
    UIBarButtonItem *cancelBtnItem = [[UIBarButtonItem alloc]initWithCustomView:cancelBtn];
    self.navigationItem.rightBarButtonItem = cancelBtnItem;

    [self initWithSearchView];
    
    [self initWithFilterView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.searchText.hidden = YES;
}

- (void)initWithFilterView {
    UIView *filterView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, Width, 45)];
    filterView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:filterView];
}

- (void)backHomeClicked {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initWithSearchView {
    self.searchText = [[UITextField alloc]initWithFrame:CGRectMake(15, 10, Width-80, 25)];
    self.searchText.layer.masksToBounds = YES;
    self.searchText.layer.cornerRadius = 10;
    self.searchText.backgroundColor = [UIColor lightGrayColor];
    self.searchText.placeholder = NSLocalizedString(@"Search_Doctor", nil);
    self.searchText.returnKeyType = UIReturnKeySearch;
    [self.navigationController.navigationBar addSubview:self.searchText];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DoctotListCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"DoctotListCell" owner:nil options:nil] firstObject];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 115;
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
