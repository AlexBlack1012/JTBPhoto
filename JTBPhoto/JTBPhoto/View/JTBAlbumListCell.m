//
//  JTBAlbumListCell.m
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "JTBAlbumListCell.h"
#import "JTBPublicConfig.h"
#import "UIColor+JTBColor.h"
#import "UIView+JTBLayout.h"

@implementation JTBAlbumListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addViews];
    }
    return self;
}

- (void)addViews {
    self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [self.contentView addSubview:self.iconImageView];
    self.albumNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(44+6, 0.0, 100, 44)];
    self.albumNameLabel.font = [UIFont systemFontOfSize:14];
    self.albumNameLabel.textColor = [UIColor hexStringToColor:@"#333333"];
    [self.contentView addSubview:self.albumNameLabel];
    
    self.albumNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    self.albumNumberLabel.font = [UIFont systemFontOfSize:14];
    self.albumNumberLabel.textColor = [UIColor hexStringToColor:@"#333333"];
    [self.contentView addSubview:self.albumNumberLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, 0.5)];
    lineView.backgroundColor = [UIColor hexStringToColor:@"EBEBEB"];
    [self.contentView addSubview:lineView];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 18 - 5.5 , 16, 5.5, 10)];
    imageView.image = [UIImage imageNamed:@"icon_gengduo"];
    [self.contentView addSubview:imageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.albumNameLabel sizeToFit];
    self.albumNameLabel.centerY = 22;
    self.albumNumberLabel.left = self.albumNameLabel.right+5;
}

- (void)updateCell:(JTBAlubumListModel *)model {
    if ([model isKindOfClass:[JTBAlubumListModel class]]) {
        
        CGSize size = CGSizeMake(80, 80);
        size.height *= [UIScreen mainScreen].scale;
        size.width *= [UIScreen mainScreen].scale;
        
        [[PHImageManager defaultManager] requestImageForAsset:model.lastObject targetSize:size contentMode:PHImageContentModeDefault options:nil resultHandler:^(UIImage *result, NSDictionary *info)
         {
             if (result == nil) {
                 //                 self.iconImageView.image = NOPhoto_Data_Pic;
             }else{
                 self.iconImageView.image = result;
             }
             
         }];
        self.albumNameLabel.text = model.title;
        self.albumNumberLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.count];
    }
}

@end
