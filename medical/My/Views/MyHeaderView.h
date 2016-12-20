//
//  MyHeaderView.h
//  medical
//
//  Created by renmiantaohua on 16/12/6.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyInfoDelegate <NSObject>

- (void)myInfoClicked:(UIButton *)sender;

@end

@interface MyHeaderView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *headerImg;
@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UILabel *balance;
@property (strong, nonatomic) IBOutlet UILabel *coupon;
@property (strong, nonatomic) IBOutlet UILabel *goldCoins;

@property (assign, nonatomic) id<MyInfoDelegate>delegate;

@end
