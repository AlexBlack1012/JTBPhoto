//
//  ViewController.m
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/16.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "ViewController.h"
#import "JTBPhotoController.h"
#import "PhotoShowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *photoSelectBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    photoSelectBtn.backgroundColor = [UIColor redColor];
    [photoSelectBtn addTarget:self action:@selector(photoSelect) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:photoSelectBtn];
    
    PhotoShowView *photoView = [[PhotoShowView alloc] initWithFrame:CGRectMake(0, 220, kScreenWidth, 60)];
    photoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:photoView];
}


- (void)photoSelect {
    
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction* takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
//        ZZCameraController *cameraController = [[ZZCameraController alloc]init];
//        cameraController.takePhotoOfMax = MAXIMAGENUMBER;
//
//        cameraController.isSaveLocal = NO;
//        [cameraController showIn:[self getParentviewController] result:^(id responseObject){
//
//            NSLog(@"%@",responseObject);
//            NSArray *array = (NSArray *)responseObject;
//
//            [self addImageToshowCirclectionView:array];
//            [circleCollectionView reloadData];
        
//        }];
        
    }];
    
    UIAlertAction* choosePictureAction = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        JTBPhotoController *photoController = [[JTBPhotoController alloc]init];
        photoController.selectPhotoOfMax = 10;
        //设置相册中完成按钮旁边小圆点颜色。
//        photoController.roundColor = [UIColor purpleColor];
        
        [photoController showIn:self result:^(id responseObject){
            
//            NSArray *array = (NSArray *)responseObject;
//            [self addImageToshowCirclectionView:array];
//            
//            [circleCollectionView reloadData];
            
        }];
    }];
    
    [alertVC addAction:cancleAction];
    [alertVC addAction:takePhotoAction];
    [alertVC addAction:choosePictureAction];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}


@end
