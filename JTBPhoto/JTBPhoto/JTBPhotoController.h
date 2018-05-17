//
//  JTBPhotoController.h
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/16.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTBPublicConfig.h"

typedef void (^JTBPhotoResult)(id responseObject);

@interface JTBPhotoController : NSObject

/*
 *    选择照片的最多张数
 */
@property(assign,nonatomic) NSInteger selectPhotoOfMax;

-(void)showIn:(UIViewController *)controller result:(JTBPhotoResult)result;


@end
