//
//  JTBPhotoListCell.h
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTBPhotoModel.h"

@interface JTBPhotoListCell : UICollectionViewCell

-(void)updatePhotoItem:(JTBPhotoModel *)photo;

@end
