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
        
        
        self.photo = [[UIImageView alloc]initWithFrame:self.bounds];
        self.photo.layer.masksToBounds = YES;
        self.photo.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.photo];
        
        
        CGFloat btnSize = 16;
        self.selectBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - btnSize - 5, 5, btnSize, btnSize)];
        [self.selectBtn addTarget:self action:@selector(selectPhotoButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
        [self.selectBtn setImage:[UIImage imageNamed:@"asset_selectedOrigion_normal"] forState:UIControlStateNormal];
        [self.selectBtn setImage:[UIImage imageNamed:@"asset_selectedOrigion_selected"] forState:UIControlStateSelected];
        [self.contentView addSubview:self.selectBtn];
        
    }
    return self;
}

- (void)selectPhotoButtonMethod:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.selectBlock) {
        self.selectBlock();
    }
}

-(void)updatePhotoItem:(JTBPhotoModel *)photo
{
    self.selectBtn.selected = photo.isSelect;
    
    if ([photo isKindOfClass:[JTBPhotoModel class]]) {
        
        [[PHImageManager defaultManager] requestImageForAsset:photo.asset targetSize:CGSizeMake(200, 200) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage *result, NSDictionary *info){
            self.photo.image = result;
            
        }];
        
    }
}

@end
