//
//  FindHospitalsViewController.m
//  medical
//
//  Created by renmiantaohua on 16/12/12.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "FindHospitalsViewController.h"
#import "FindHospitalsCell.h"
#import "HospitalDetailsViewController.h"

@interface FindHospitalsViewController ()

@end

@implementation FindHospitalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FindHospitalsCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FindHospitalsCell" owner:nil options:nil] firstObject];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"HospitalDetails" bundle:nil];
    HospitalDetailsViewController *hospitalDesVC = [storyboard instantiateViewControllerWithIdentifier:@"HospitalDetailsViewController"];
    [self.navigationController pushViewController:hospitalDesVC animated:YES];
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
