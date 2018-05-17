//
//  JTBAlbumListViewController.m
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "JTBAlbumListViewController.h"
#import "JTBPublicConfig.h"
#import "JTBAlbumListCell.h"
#import "JTBAlubumListModel.h"
#import "JTBPhotoManager.h"

#import "JTBPhotoListViewController.h"

@interface JTBAlbumListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(strong,nonatomic) UITableView      *alumbTable;
@property(strong,nonatomic) PHPhotoLibrary   *assetsLibrary;
@property(strong,nonatomic) NSMutableArray   *alubms;

@end

@implementation JTBAlbumListViewController

-(NSMutableArray *)alubms
{
    if (!_alubms) {
        _alubms = [NSMutableArray array];
    }
    return _alubms;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.alumbTable = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.alumbTable.delegate = self;
    self.alumbTable.dataSource = self;
    self.alumbTable.separatorStyle = NO;
    self.alumbTable.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.alumbTable];
    
    self.alubms = [[JTBPhotoManager ShareManager] getAllAlubumsList];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.alubms.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"JTBPhotoListCell";
    JTBAlbumListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[JTBAlbumListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell updateCell:self.alubms[indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JTBPhotoListViewController * photoListVC = [[JTBPhotoListViewController alloc]init];
    photoListVC.selectNum = self.selectNum;
    photoListVC.photoResult = self.photoResult;
    
    JTBAlubumListModel *model = self.alubms[indexPath.row];
    photoListVC.fetch = [[JTBPhotoManager ShareManager] fetchAssetsInAssetCollection:model.assetCollection ascending:YES];
    
    [self.navigationController pushViewController:photoListVC animated:YES];
    
    
}

@end
