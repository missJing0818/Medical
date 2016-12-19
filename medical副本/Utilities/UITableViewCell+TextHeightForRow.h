//
//  UITableViewCell+TextHeightForRow.h
//  unionkd
//
//  Created by zhangJing on 16/6/15.
//  Copyright © 2016年 vprisk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (TextHeightForRow)

+ (CGFloat)getTextHeight:(NSString *)text fontSize:(CGFloat)fontSize
              labelWidth:(CGFloat)width;

@end
