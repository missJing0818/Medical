//
//  MyHeaderView.m
//  medical
//
//  Created by renmiantaohua on 16/12/6.
//  Copyright © 2016年 zhide. All rights reserved.
//

#import "MyHeaderView.h"

@implementation MyHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
}

- (IBAction)balanceClicked:(id)sender {
    
}

- (IBAction)couponClicked:(id)sender {
    
}

- (IBAction)goldCoinsClicked:(id)sender {
    
}

- (IBAction)userInfoClicked:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(myInfoClicked:)]) {
        [_delegate myInfoClicked:sender];
    }
}

@end
