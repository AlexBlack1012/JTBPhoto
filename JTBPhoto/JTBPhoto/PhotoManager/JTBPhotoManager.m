//
//  JTBPhotoManager.m
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/16.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "JTBPhotoManager.h"
#import "JTBAlubumListModel.h"
#import "JTBPhotoModel.h"

@implementation JTBPhotoManager

+(instancetype)ShareManager{
    
    static JTBPhotoManager * manager = nil;
    
    @synchronized(manager) {
        if (manager == nil) {
            manager = [[self alloc]init];
        }
    }
    return manager;
    
}

-(NSMutableArray *) getAllAlubumsList {
    NSMutableArray<JTBAlubumListModel *> * photoList = [NSMutableArray array];

    /**
     *  获取多有的系统相册
     */
    PHFetchResult * smartAlbum = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection *collection in smartAlbum) {
        if (!([collection.localizedTitle isEqualToString:@"最近删除"] || [collection.localizedTitle isEqualToString:@"视频"])) {//本地英文Recently Deleted/Videos
            PHFetchResult * result = [self fetchAssetsInAssetCollection:collection ascending:NO];
            if (result.count > 0) {
                JTBAlubumListModel * list = [[JTBAlubumListModel alloc]init];
                list.title = collection.localizedTitle;
                list.count = result.count;
                list.lastObject = result.lastObject;
                list.assetCollection = collection;
                [photoList addObject:list];
            }
        }
    }
    /**
     *  用户创建的相册
     */
    PHFetchResult * userAlbum = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil];
    for (PHAssetCollection *collection in userAlbum) {
        PHFetchResult *result = [self fetchAssetsInAssetCollection:collection ascending:NO];
        if (result.count > 0) {
            JTBAlubumListModel * list = [[JTBAlubumListModel alloc]init];
            //            list.title = [self transformAblumTitle:collection.localizedTitle];
            if (list.title == nil) {
                list.title = collection.localizedTitle;
            }
            list.count = result.count;
            list.lastObject = result.lastObject;
            list.assetCollection = collection;
            [photoList addObject:list];
            
        }
    }
    
    
    return photoList;
}

- (PHFetchResult *)fetchAssetsInAssetCollection:(PHAssetCollection *)assetCollection ascending:(BOOL)ascending
{
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:ascending]];
    PHFetchResult *result = [PHAsset fetchAssetsInAssetCollection:assetCollection options:option];
    return result;
}


-(NSMutableArray *) getPhotoAssets:(PHFetchResult *)fetchResult {
    NSMutableArray *dataArray = [NSMutableArray array];
    for (PHAsset *asset in fetchResult) {
        //只添加图片类型资源，过滤除视频类型资源
        if (asset.mediaType == PHAssetMediaTypeImage) {
            JTBPhotoModel *photo = [[JTBPhotoModel alloc]init];
            photo.asset = asset;
            [dataArray addObject:photo];
        }
        
    }
    
    return dataArray;
}

@end
