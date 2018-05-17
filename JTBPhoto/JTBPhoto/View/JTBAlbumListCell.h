//
//  JTBAlbumListCell.h
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTBAlubumListModel.h"

@interface JTBAlbumListCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *albumNameLabel;
@property (nonatomic, strong) UILabel *albumNumberLabel;

- (void)updateCell:(JTBAlubumListModel *)model;

@end
