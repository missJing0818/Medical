//
//  PictureAddCell.m
//  类似QQ图片添加、图片浏览
//
//  Created by seven on 16/3/31.
//  Copyright © 2016年 QQpicture. All rights reserved.
//

#import "PictureAddCell.h"

@implementation PictureAddCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
     _addImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_addImageView];
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _addImageView.frame = CGRectMake(0, 0, 100, 100);
    _addImageView.image = [UIImage imageNamed:@"Add.png"];

}


@end
