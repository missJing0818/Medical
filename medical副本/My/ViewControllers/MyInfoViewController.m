
//
//  MyInfoViewController.m
//  medical
//
//  Created by renmiantaohua on 16/12/8.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = true;

        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"选择头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                
            }else{
                NSLog(@"请设置相机");
            }
            [self.navigationController presentViewController:picker animated:YES completion:nil];
        }]];
        
        [alertVC addAction:[UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self.navigationController presentViewController:picker animated:YES completion:nil];
        }]];
        
        [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }
}

#pragma 拍照选择照片协议方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
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
