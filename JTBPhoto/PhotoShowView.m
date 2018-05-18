//
//  PhotoShowView.m
//  HZOperations
//
//  Created by 陈良峰 on 2018/3/2.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "PhotoShowView.h"
#import "JTBPublicConfig.h"
#import "ImageShowCell.h"

//#import "Base.h"
//#import "UIImageView+WebCache.h"
//#import "MJPhotoBrowser.h"


@interface PhotoShowView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *mediaView;
@property (nonatomic,assign) CGFloat cellWidth;
@property (nonatomic,assign) CGFloat cellHeight;


@end

@implementation PhotoShowView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showPhotos = [NSMutableArray array];
        self.cellHeight = frame.size.height;
        self.cellWidth = self.cellHeight;
        if (!self.mediaView) {
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            self.mediaView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.cellHeight) collectionViewLayout:layout];
            self.mediaView.scrollEnabled = YES;
            self.mediaView.backgroundColor = [UIColor clearColor];
            [self.mediaView registerClass:[ImageShowCell class] forCellWithReuseIdentifier:@"ImageShowCell"];
            self.mediaView.dataSource = self;
            self.mediaView.delegate = self;
            self.mediaView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
            [self addSubview:self.mediaView];
        }
    }
    
    return self;
}

- (void)setShowPhotos:(NSMutableArray *)showPhotos {
    _showPhotos = showPhotos;
    [self.mediaView reloadData];
}

#pragma mark Collection M
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.showPhotos.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageShowCell *ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageShowCell" forIndexPath:indexPath];
 
    
    return ccell;
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.cellWidth, self.cellHeight);
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsZero;
//}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *photos = [NSMutableArray array];
    if (self.showPhotos.count > 0 && indexPath.row < self.showPhotos.count) {
//        for (int i = 0; i < self.showPhotos.count; i++) {
//            MJPhoto *photo = [[MJPhoto alloc] init];
//            //            photo.srcImageView = [_imageViewsDict objectForKey:indexPath]; // 来源于哪个UIImageView
//            photo.url = [NSURL URLWithString:[self.showPhotos[i] valueForKey:@"src"]]; // 图片路径
//            [photos addObject:photo];
//        }
//
//        // 2.显示相册
//        MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
//        browser.currentPhotoIndex = indexPath.row; // 弹出相册时显示的第一张图片是？
//        browser.photos = photos; // 设置所有的图片
//        browser.showSaveBtn = NO;
//
//        [browser show];
    }
}

@end
