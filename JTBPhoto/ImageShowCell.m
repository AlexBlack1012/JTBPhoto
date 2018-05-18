//
//  ImageShowCell.m
//  HZOperations
//
//  Created by 陈良峰 on 2018/3/15.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "ImageShowCell.h"
#import "UIView+JTBLayout.h"


#define kImageView_Width 105

@interface ImageShowCell()


@property (strong, nonatomic) UIImageView *imgView;
@property (nonatomic,strong) UIButton *deleteBtn;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;

@end

@implementation ImageShowCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setModel:(JTBPhotoModel *)model {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kImageView_Width, kImageView_Width)];
        _imgView.clipsToBounds = YES;
        _imgView.userInteractionEnabled = YES;
        [self.contentView addSubview:_imgView];
        
    }
    
    _model = model;
    if (model) {
        if (!_deleteBtn) {
            _deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(kImageView_Width-20, 0, 20, 20)];
            [_deleteBtn setImage:[UIImage imageNamed:@"jtb_icn_delete"] forState:UIControlStateNormal];
            [_deleteBtn addTarget:self action:@selector(deleteBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:_deleteBtn];
        }
        if (!_activityIndicator) {
            _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            _activityIndicator.hidesWhenStopped = YES;
            [self.contentView addSubview:_activityIndicator];
            _activityIndicator.center = self.contentView.center;
        }
    }
    _imgView.image = model.thumbnailImage;
}

- (void)deleteBtnClicked:(id)sender{

}

+(CGSize)ccellSize{
    return CGSizeMake(kImageView_Width, kImageView_Width);
}

@end
