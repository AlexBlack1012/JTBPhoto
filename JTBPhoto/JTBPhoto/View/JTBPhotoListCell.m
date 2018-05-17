//
//  JTBPhotoListCell.m
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "JTBPhotoListCell.h"

@interface JTBPhotoListCell()

@property(strong,nonatomic) UIImageView *photo;
@property (nonatomic,strong) UIButton *selectBtn;

@end

@implementation JTBPhotoListCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _photo = [[UIImageView alloc]initWithFrame:self.bounds];
        
        _photo.layer.masksToBounds = YES;
        
        _photo.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.contentView addSubview:_photo];
        
        
        CGFloat btnSize = self.frame.size.width / 4;

        self.selectBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - btnSize - 5, 5, btnSize, btnSize)];
        [self.selectBtn addTarget:self action:@selector(selectPhotoButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.selectBtn];
        
    }
    return self;
}

-(void)updatePhotoItem:(JTBPhotoModel *)photo
{
//    if (photo.isSelect == YES) {
//        [_selectBtn setImage:Pic_Btn_Selected forState:UIControlStateNormal];
//    }else{
//        [_selectBtn setImage:Pic_btn_UnSelected forState:UIControlStateNormal];
//    }
    
    if ([photo isKindOfClass:[JTBPhotoModel class]]) {
        
        [[PHImageManager defaultManager] requestImageForAsset:photo.asset targetSize:CGSizeMake(200, 200) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage *result, NSDictionary *info){
            self.photo.image = result;
            
        }];
        
    }
}

@end
