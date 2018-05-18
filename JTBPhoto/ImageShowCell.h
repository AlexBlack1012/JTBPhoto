//
//  ImageShowCell.h
//  HZOperations
//
//  Created by 陈良峰 on 2018/3/15.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTBPhotoModel.h"

@interface ImageShowCell : UICollectionViewCell

@property (nonatomic,strong)JTBPhotoModel *model;

+(CGSize)ccellSize;

@end
