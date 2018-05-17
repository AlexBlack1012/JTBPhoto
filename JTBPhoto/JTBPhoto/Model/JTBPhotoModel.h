//
//  JTBPhotoModel.h
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JTBPublicConfig.h"

@interface JTBPhotoModel : NSObject

/**
 资源
 */
@property (nonatomic, strong) PHAsset *asset;
/**
 原尺寸图片
 */
@property (nonatomic, strong) UIImage *originImage;
/**
 照片在手机中的路径
 */
@property (nonatomic, strong) NSURL *imageUrl;
/**
 照片保存到相册中的时间
 */
@property (nonatomic, copy)   NSDate *createDate;
/**
 判断该图片是否选中
 */
@property (nonatomic, assign) BOOL isSelect;

@end
