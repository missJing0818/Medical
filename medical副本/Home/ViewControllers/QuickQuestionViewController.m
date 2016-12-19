//
//  QuickQuestionViewController.m
//  medical
//
//  Created by renmiantaohua on 16/12/8.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "QuickQuestionViewController.h"
#import "PictureAddCell.h"
#import "PictureCollectionViewCell.h"
#import "ELCImagePickerController.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"
#import "MJPhotoView.h"

@interface QuickQuestionViewController ()<UITextViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,ELCAssetSelectionDelegate,ELCImagePickerControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,MJPhotoViewDelegate>

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeHolder;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *imgArray;

@end

@implementation QuickQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initWithContentTextView];
    
    [self initWithCollectionView];
    
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(nextClicked)];
    self.navigationItem.rightBarButtonItem = nextItem;
    
    self.imgArray = [NSMutableArray array];
    
    [self.collectionView registerClass:[PictureCollectionViewCell class]forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[PictureAddCell class] forCellWithReuseIdentifier:@"addItemCell"];
}

- (void)nextClicked {
    
}

- (void)initWithCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumLineSpacing = 2;
    layout.minimumInteritemSpacing = 2;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 160, Width-20, Height-160) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

- (void)initWithContentTextView {
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, Width-20, 150)];
    [self.textView becomeFirstResponder];
    self.textView.delegate = self;
    [self.view addSubview:self.textView];
    
    self.placeHolder = [[UILabel alloc]initWithFrame:CGRectMake(5, -3, Width-20, 50)];
    self.placeHolder.text = NSLocalizedString(@"Question_Placeholder", nil);
    self.placeHolder.font = [UIFont systemFontOfSize:12.0];
    self.placeHolder.numberOfLines = 0;
    self.placeHolder.textColor = [UIColor lightGrayColor];
    [self.textView addSubview:self.placeHolder];
}

- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length == 0) {
        self.placeHolder.hidden = NO;
        
    }else {
        self.placeHolder.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   
    return self.imgArray.count + 1;
}

-  (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.imgArray.count) {
        static NSString *addItem = @"addItemCell";
        PictureAddCell *addItemCell = [collectionView dequeueReusableCellWithReuseIdentifier:addItem forIndexPath:indexPath];
        
        return addItemCell;
    }else {
        static NSString *identify = @"cell";
        PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
        
        cell.imageView.image = self.imgArray[indexPath.row];
        
        return cell;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.imgArray.count) {
        UIAlertController *moreAct = [UIAlertController alertControllerWithTitle:nil message:NSLocalizedString(@"上传图片", nil) preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *picAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"手机相册", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            ELCImagePickerController *elcPickerVC = [[ELCImagePickerController alloc]init];
            elcPickerVC.maximumImagesCount = 6 - _imgArray.count;
//            elcPickerVC.returnsImage = YES;
//            elcPickerVC.onOrder = NO;
//            elcPickerVC.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie];
            elcPickerVC.imagePickerDelegate = self;
            [self presentViewController:elcPickerVC animated:YES completion:nil];
        }];
        
        UIAlertAction *camerAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"相机", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *picker = [[UIImagePickerController alloc]init];
                picker.delegate = self;
                picker.allowsEditing = YES;
                picker.sourceType = sourceType;
                [self presentViewController:picker animated:YES completion:nil];
            }
        }];
        //取消
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [moreAct addAction:picAction];
        [moreAct addAction:camerAction];
        [moreAct addAction:cancelAction];
        
        [self presentViewController:moreAct animated:YES completion:^{
            ;
        }];

    }else {
        NSMutableArray *photoArray = [[NSMutableArray alloc]init];
        for (int i = 0; i<self.imgArray.count; i++) {
            UIImage *image = self.imgArray[i];
            MJPhoto *photo = [MJPhoto new];
            photo.image = image;
            PictureCollectionViewCell *cell = (PictureCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            photo.srcImageView = cell.imageView;
            [photoArray addObject:photo];
        }
        MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
//        browser. = self;
        browser.currentPhotoIndex = indexPath.row;
        browser.photos = photoArray;
        [browser show];

    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info {
    __weak QuickQuestionViewController *wself = self;
    [self dismissViewControllerAnimated:YES completion:^{
        NSMutableArray *images = [NSMutableArray array];
        for (NSDictionary *dic in info) {
            if ([dic objectForKey:UIImagePickerControllerOriginalImage]) {
                UIImage *image = [dic objectForKey:UIImagePickerControllerOriginalImage];
                [images addObject:image];
            }
        }
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (unsigned long i = wself.imgArray.count; i < wself.imgArray.count + images.count; i++) {
            
            [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
        }
        [wself.imgArray addObjectsFromArray:images];
        [wself.collectionView insertItemsAtIndexPaths:indexPaths];
        
    }];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [self.imgArray addObject:[info objectForKey:UIImagePickerControllerOriginalImage]];
    __weak QuickQuestionViewController *wself = self;
    [picker dismissViewControllerAnimated:YES completion:^{
        [wself.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:wself.imgArray.count-1 inSection:0]]];
    }];
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)deletedPictures:(NSSet *)set {
    NSMutableArray *cellArray = [NSMutableArray array];
    for (NSString *index1 in set) {
        [cellArray addObject:index1];
    }
    if (cellArray.count == 0) {
        
    }else if (cellArray.count == 1 && _imgArray.count == 1){
        NSIndexPath *indexPathTwo = [NSIndexPath indexPathForRow:0 inSection:0];
        [_imgArray removeObjectAtIndex:indexPathTwo.row];
        [self.collectionView deleteItemsAtIndexPaths:@[indexPathTwo]];
    }else {
        for (int i =0; i <cellArray.count-1; i++) {
            for (int j = 0; j< cellArray.count-1-i; j++) {
                if ([cellArray[j] intValue] < [cellArray[j+1]intValue]) {
                    NSString *temp = cellArray[j];
                    cellArray[j] = cellArray[j+1];
                    cellArray[j+1] = temp;
                }
            }
        }
        for (int b = 0; b<cellArray.count; b++) {
            int index = [cellArray[b] intValue]-1;
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
            [self.imgArray removeObjectAtIndex:indexPath.row];
            [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
        }
    }
}

@end
