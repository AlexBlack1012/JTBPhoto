//
//  ImageShowCell.m
//  HZOperations
//
//  Created by 陈良峰 on 2018/3/15.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "ImageShowCell.h"


#define kTweetSendImageCCell_Width 105

@implementation ImageShowCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!_imgView) {
            _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _imgView.clipsToBounds = YES;
            _imgView.userInteractionEnabled = YES;
            [self.contentView addSubview:_imgView];
            
        }
    }
    return self;
}




@end
