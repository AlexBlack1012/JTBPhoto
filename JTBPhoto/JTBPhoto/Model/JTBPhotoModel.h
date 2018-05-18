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

typedef NS_ENUM(NSInteger,ImageDownloadState)
{
    ImageDownloadStateInit = 0,
    ImageDownloadStateIng,
    ImageDownloadStateSuccess,
    ImageDownloadStateFail
};

@interface JTBPhotoModel : NSObject


//选取照片的时候
/**
 资源
 */
@property (nonatomic, strong) PHAsset *asset;

/**
 判断该图片是否选中
 */
@property (nonatomic, assign) BOOL isSelect;

//显示照片的时候
/**
 原尺寸图片
 */
@property (nonatomic, strong) UIImage *originImage;

/**
 缩略图
 */
@property (nonatomic,strong) UIImage *thumbnailImage;

/**
 iCloud 图片下载状态
 */
@property (nonatomic,assign) ImageDownloadState downloadState;

@end
