//
//  JTBAlubumListModel.h
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/16.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTBPublicConfig.h"

@interface JTBAlubumListModel : NSObject

@property (assign, nonatomic) NSInteger count;
@property (strong, nonatomic) PHAsset *lastObject;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) PHAssetCollection *assetCollection;

@end
