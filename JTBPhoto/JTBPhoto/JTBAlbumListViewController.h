//
//  JTBAlbumListViewController.h
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTBAlbumListViewController : UIViewController

@property(assign,nonatomic) NSInteger selectNum;

@property(strong,nonatomic) void (^photoResult)(id responseObject);

@end
