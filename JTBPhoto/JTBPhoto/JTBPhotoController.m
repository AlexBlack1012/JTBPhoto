//
//  JTBPhotoController.m
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/16.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "JTBPhotoController.h"
#import "JTBAlbumListViewController.h"

@interface  JTBPhotoController()

@property (nonatomic,strong) JTBAlbumListViewController *photoListVC;
@property (nonatomic,strong) UINavigationController *photoListNc;


@end

@implementation JTBPhotoController

#pragma mark ---- 懒加载控制器
-(JTBAlbumListViewController *)photoListVC{
    if (!_photoListVC) {
        _photoListVC = [[JTBAlbumListViewController alloc]init];
    }
    return _photoListVC;
}

-(UINavigationController *)photoListNc{
    if (!_photoListNc) {
        _photoListNc = [[UINavigationController alloc]initWithRootViewController:self.photoListVC];
    }
    [_photoListNc.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    return _photoListNc;
}

//-(ZZPhotoPickerViewController *)photoPickerController{
//    if (!_photoPickerController) {
//        _photoPickerController = [[ZZPhotoPickerViewController alloc]init];
//    }
//    return _photoPickerController;
//}

#pragma mark ---- 弹出控制器
-(void)showIn:(UIViewController *)controller result:(JTBPhotoResult)result{
    
    //相册权限判断
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied) {
        //相册权限未开启
        [self showAlertViewToController:controller];
        
    }else if(status == PHAuthorizationStatusNotDetermined){
        //相册进行授权
        /* * * 第一次安装应用时直接进行这个判断进行授权 * * */
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
            //授权后直接打开照片库
            if (status == PHAuthorizationStatusAuthorized){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showController:controller result:result];
                });
                
            }
        }];
    }else if (status == PHAuthorizationStatusAuthorized){
        [self showController:controller result:result];
    }
    
}

//授权完成，打开相册
-(void)showController:(UIViewController *)controller result:(JTBPhotoResult)result
{
    //授权完成，打开相册
    
    //Block传值
    self.photoListVC.photoResult = result;
    //先向presentViewController控制器ZZPhotoListViewController，此控制器为全部相册控制器
    
    /* * *   同时设定最多选择照片的张数  * * */
    self.photoListVC.selectNum = _selectPhotoOfMax;
    
    [self showPhotoList:controller];
    
    
//    //Block传值
//    self.photoPickerController.PhotoResult = result;
//    self.photoPickerController.isAlubSeclect = NO;
//    self.photoPickerController.roundColor = self.roundColor;
//    /* * *   同时设定最多选择照片的张数  * * */
//    self.photoPickerController.selectNum = _selectPhotoOfMax;
//
//    //然后再执行pushViewController控制器ZZPhotoPickerViewController
//    //此控制器为详情相册，显示某个相册中的详细照片
//    [self showPhotoPicker:self.photoListController.navigationController];
}

-(void)showPhotoList:(UIViewController *)controller
{
    [controller presentViewController:self.photoListNc animated:YES completion:nil];
}

//向用户说明怎么授权
-(void)showAlertViewToController:(UIViewController *)controller
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app名称
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提醒" message:[NSString stringWithFormat:@"请在iPhone的“设置->隐私->照片”开启%@访问你的手机相册",app_Name] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }];
    
    [alert addAction:action1];
    [controller presentViewController:alert animated:YES completion:nil];
}



@end
