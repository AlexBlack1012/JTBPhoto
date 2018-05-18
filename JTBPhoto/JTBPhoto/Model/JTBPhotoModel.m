//
//  JTBPhotoModel.m
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "JTBPhotoModel.h"

@implementation JTBPhotoModel

- (UIImage *)thumbnailImage{
    PHImageRequestOptions *imageOptions = [[PHImageRequestOptions alloc] init];
    imageOptions.synchronous = YES;
    imageOptions.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    imageOptions.resizeMode = PHImageRequestOptionsResizeModeFast;
    imageOptions.networkAccessAllowed = YES;
    PHImageManager *imageManager = [PHImageManager defaultManager];
    __block UIImage *assetImage;
    [imageManager requestImageForAsset:self.asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:imageOptions resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        assetImage = result;
    }];
    return assetImage;
}





@end
