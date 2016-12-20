
//
//  HomeViewController.m
//  medical
//
//  Created by renmiantaohua on 16/12/7.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeOneCell.h"
#import "SDCycleScrollView.h"
#import "HomeTwoCell.h"
#import "HomeThreeViewCell.h"
#import "UITableViewCell+TextHeightForRow.h"
#import "SearchView.h"
#import "SearchViewController.h"
#import "QuickQuestionViewController.h"
#import "FindDoctorViewController.h"
#import "FindHospitalsViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, strong) UITableView *myTable;
@property (nonatomic, strong) SDCycleScrollView *sdcScrollView;
@property (nonatomic, strong) UIView *ADView;
@property (nonatomic, strong) NSMutableArray *imgArray;
@property (nonatomic, strong) SearchView *searchView;
@property (nonatomic, strong) UIBarButtonItem *messageBtnItem;
@property (nonatomic, strong) UIButton *messageBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imgArray = [NSMutableArray array];
    
    [self initWithSearchBar];
    
    [self initWithTableView];
    
   self.messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.messageBtn.frame = CGRectMake(0, 0, 25, 25);
//    [messageBtn addTarget:self action:@selector(backHomeClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.messageBtn setImage:[UIImage imageNamed:@"icon_share_link"] forState:UIControlStateNormal];
    self.messageBtnItem = [[UIBarButtonItem alloc]initWithCustomView:self.messageBtn];
    self.navigationItem.rightBarButtonItem = self.messageBtnItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.searchBtn.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.searchBtn.hidden = YES;
}

- (void)initWithSearchBar {
    
    self.searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, Width-80, 25)];
    self.searchBtn.layer.masksToBounds = YES;
    self.searchBtn.layer.cornerRadius = 10;
    [self.searchBtn addTarget:self action:@selector(jumpSearchVC) forControlEvents:UIControlEventTouchUpInside];
     [self.searchBtn setTitle:NSLocalizedString(@"Home_SearchText", nil) forState:UIControlStateNormal];
    self.searchBtn.backgroundColor = [UIColor lightGrayColor];
    [self.navigationController.navigationBar addSubview:self.searchBtn];
}

- (void)initWithTableView {
    self.myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStyleGrouped];
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    [self.view addSubview:self.myTable];
}

- (void)initWithADView {
    self.ADView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 80)];
    NSArray *img = @[@"00001Icon",@"icon_share_qzone"];
    self.sdcScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, Width, 80) imageNamesGroup:img];
    self.sdcScrollView.currentPageDotColor = [UIColor whiteColor];
    self.sdcScrollView.autoScrollTimeInterval = 2.0;
    [self.ADView addSubview:self.sdcScrollView];
}

- (void)jumpSearchVC {
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    searchVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeOneCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"HomeOneCell" owner:nil options:nil] firstObject];
        
        return cell;
        
    } else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        [self initWithADView];
        [cell addSubview:self.ADView];
        
        return cell;
        
    } else if (indexPath.section == 2) {
        HomeTwoCell *cellTwo = [[[NSBundle mainBundle]loadNibNamed:@"HomeTwoCell" owner:nil options:nil] firstObject];

        return cellTwo;
        
    } else if (indexPath.section == 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        cell.textLabel.text = NSLocalizedString(@"Home_HealthAssistant", nil);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    } else if (indexPath.section == 4) {
        HomeThreeViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeThreeViewCell" owner:nil options:nil] firstObject];
        
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        QuickQuestionViewController *questionVC = [[QuickQuestionViewController alloc]init];
        questionVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:questionVC animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        
        FindDoctorViewController *findDoctorVC = [[FindDoctorViewController alloc]init];
        findDoctorVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:findDoctorVC animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 2) {
        FindHospitalsViewController *findHospitalsVC = [[FindHospitalsViewController alloc]init];
        findHospitalsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:findHospitalsVC animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return 90;
    }else if (indexPath.section == 3) {
        return 45;
    }else if (indexPath.section == 4) {
        NSString *str = @"这对一些文本字段必须始终保持活跃状态的程序很有用，比如即时消息";
        return 80+[HomeThreeViewCell getTextHeight:str fontSize:13.0 labelWidth:Width-16];
    }
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
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
