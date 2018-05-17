//
//  JTBPhotoManager.h
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/16.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTBPublicConfig.h"

@interface JTBPhotoManager : NSObject

+(instancetype)ShareManager;

/*
 *    获取全部相册
 */
-(NSMutableArray *) getAllAlubumsList;


/*
 *    获取图片实体，并把图片结果存放到数组中，返回值数组
 */
-(NSMutableArray *) getPhotoAssets:(PHFetchResult *)fetchResult;


/*
 *    获取某一个相册的结果集
 */
- (PHFetchResult *)fetchAssetsInAssetCollection:(PHAssetCollection *)assetCollection ascending:(BOOL)ascending;

@end
