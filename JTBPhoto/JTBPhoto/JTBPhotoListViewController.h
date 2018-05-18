//
//  JTBPhotoListViewController.h
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTBPublicConfig.h"


@interface JTBPhotoListViewController : UIViewController

@property(strong,nonatomic) void (^photoResult)(id responseObject);

@property (assign,nonatomic) NSInteger       selectNum;
@property (assign,nonatomic) BOOL            isAlubSeclect;
@property (strong,nonatomic) PHFetchResult   *fetch;

@end
