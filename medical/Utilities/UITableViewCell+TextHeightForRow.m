//
//  UITableViewCell+TextHeightForRow.m
//  unionkd
//
//  Created by zhangJing on 16/6/15.
//  Copyright © 2016年 vprisk. All rights reserved.
//

#import "UITableViewCell+TextHeightForRow.h"

@implementation UITableViewCell (TextHeightForRow)

+ (CGFloat)getTextHeight:(NSString *)text fontSize:(CGFloat)fontSize
              labelWidth:(CGFloat)width {
    //准备工作
    CGSize size = CGSizeMake(width, 1000000);
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    //方法
    //size 宽度要和上面的label定义时的宽度一样,高度给一个足够大的值
    //options:两个值分别表示,计算文字间的空白,还有文字字体大小影响
    //attributes:告诉这个方法,计算字体大小的时候大小是多少
    
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading |NSStringDrawingUsesDeviceMetrics attributes:dic context:nil];
    
    return rect.size.height;

}

@end
