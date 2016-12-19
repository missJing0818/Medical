//
//  HospitalDetailsViewController.m
//  medical
//
//  Created by renmiantaohua on 16/12/12.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "HospitalDetailsViewController.h"
#import "DoctorCell.h"
#import "HospitalNameCell.h"
#import "HospitalInfoCell.h"
#import "HospitalPhoneCell.h"
#import "UITableViewCell+TextHeightForRow.h"
#import "HospitalAddressCell.h"

@interface HospitalDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *doctorLabel;
@property (strong, nonatomic) UIButton *moreBtn;

@end

@implementation HospitalDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, Width, 120) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"DoctorCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, 100)];
    self.imgView.backgroundColor = [UIColor lightGrayColor];
    
    self.doctorLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 15, 50, 15)];
    self.doctorLabel.font = [UIFont systemFontOfSize:16];
    self.doctorLabel.text = NSLocalizedString(@"Hospital_Doctor", nil);
    
    self.moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.moreBtn.frame = CGRectMake(Width-70, 10, 62, 25);
    [self.moreBtn setTitle:NSLocalizedString(@"Hospital_More", nil) forState:UIControlStateNormal];
    [self.moreBtn setTitleColor:TextColor forState:UIControlStateNormal];
    self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self initWithBottomView];
}

-(void)initWithBottomView {
    UIButton *registerbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, Height-45, Width, 45)];
    [registerbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registerbtn.backgroundColor = [UIColor greenColor];
    [registerbtn addTarget:self action:@selector(registerClicked) forControlEvents:UIControlEventTouchUpInside];
    [registerbtn setTitle:NSLocalizedString(@"Hospital_Register", nil) forState:UIControlStateNormal];
    [self.view addSubview:registerbtn];
}

- (void)registerClicked {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellImage"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellImage"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.imgView];
        return cell;
        
    }else if (indexPath.row == 1) {
        HospitalNameCell *nameCell = [tableView dequeueReusableCellWithIdentifier:@"HospitalNameCell" ];
        
        return nameCell;
        
    }else if (indexPath.row == 2) {
        HospitalInfoCell *infoCell = [[[NSBundle mainBundle]loadNibNamed:@"HospitalInfoCell" owner:nil options:nil] firstObject];

        return infoCell;
        
    }else if (indexPath.row == 3) {
        HospitalAddressCell *addCell = [[[NSBundle mainBundle]loadNibNamed:@"HospitalAddressCell" owner:nil options:nil] firstObject];
        addCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return addCell;
        
    }else if (indexPath.row == 4) {
     
        HospitalPhoneCell *phoneCell = [[[NSBundle mainBundle]loadNibNamed:@"HospitalPhoneCell" owner:nil options:nil] firstObject];
        phoneCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return phoneCell;
        
    }else if (indexPath.row == 5 ){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellDoc"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellDoc"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.doctorLabel];
        [cell addSubview:self.moreBtn];
        return cell;
        
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        [cell addSubview:self.collectionView];
        return cell;
    }

    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    }else if (indexPath.row == 6) {
        return 120;
    }else if (indexPath.row == 2) {
        return 40 + [HospitalInfoCell getTextHeight:@"由 TortoiseGit TortoiseGit 是开源的应用程序被设计成最受欢迎的 Git 版本控制系统的接口。不幸的是，您不能下载 TortoiseGit 为 Mac，但幸运的是有其他的解决方案可在互联网上。所以，如果你正在寻找 Mac 的 TortoiseGit 的替代方法，然后 Git 客户从该列表中可能帮助你。" fontSize:13 labelWidth:Width-16];
    }
    return 45;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DoctorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(108,115);
}

@end
