//
//  JTBPhotoListViewController.m
//  JTBPhoto
//
//  Created by 陈良峰 on 2018/5/17.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import "JTBPhotoListViewController.h"
#import "JTBPhotoManager.h"
#import "JTBPhotoListCell.h"
#import "JTBPhotoModel.h"


@interface JTBPhotoListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) UIBarButtonItem *backBtn;
@property (strong, nonatomic) UIBarButtonItem *cancelBtn;

@property (nonatomic,strong) NSMutableArray *photoArray;
@property (strong, nonatomic) UICollectionView *photoCollection;

@property (nonatomic,strong) NSMutableArray *selectArray;

//@property (strong, nonatomic) UILabel *totalNumLabel;
@end

@implementation JTBPhotoListViewController

#pragma SETUP backButtonUI Method

//-(UILabel *)totalNumLabel{
//    if (!_totalNumLabel) {
//        _totalNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, 20)];
//        _totalNumLabel.textColor = [UIColor blackColor];
//        _totalNumLabel.textAlignment = NSTextAlignmentCenter;
//    }
//    return _totalNumLabel;
//}

- (UIBarButtonItem *)backBtn{
    if (!_backBtn) {
        
        UIButton *back_btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 44)];
        [back_btn setImage:[UIImage imageNamed:@"back_button_normal.png"] forState:UIControlStateNormal];
        [back_btn setImage:[UIImage imageNamed:@"back_button_high.png"] forState:UIControlStateHighlighted];
        back_btn.frame = CGRectMake(0, 0, 45, 44);
        [back_btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        _backBtn = [[UIBarButtonItem alloc] initWithCustomView:back_btn];
        
    }
    return _backBtn;
}

#pragma SETUP cancelButtonUI Method
- (UIBarButtonItem *)cancelBtn{
    if (!_cancelBtn) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
        [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:17.0f];
        [button.titleLabel setFont:[UIFont systemFontOfSize:17]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _cancelBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
        
    }
    return _cancelBtn;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)cancel{
    if ([self.selectArray count] == 0) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        if (self.photoResult) {
            self.photoResult(self.selectArray);
        }
    }
}

#pragma Declaration Array
-(NSMutableArray *)photoArray
{
    if (!_photoArray) {
        _photoArray = [NSMutableArray array];
    }
    return _photoArray;
}

-(NSMutableArray *)selectArray
{
    if (!_selectArray) {
        _selectArray = [NSMutableArray array];
    }
    return _selectArray;
}

- (void)initInterUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.backBtn;
    self.navigationItem.rightBarButtonItem = self.cancelBtn;
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initInterUI];
    [self getPhotoListModel];
    [self setupCollectionView];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    //滚动到底部
    if (self.photoArray.count != 0) {
        [self.photoCollection scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.photoArray.count - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
    }
}

- (void)getPhotoListModel {
    self.photoArray = [[JTBPhotoManager ShareManager] getPhotoAssets:self.fetch];
//    self.totalNumLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.photoArray.count];
}

- (void)setupCollectionView {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    CGFloat photoSize = ([UIScreen mainScreen].bounds.size.width - 3) / 4;
    flowLayout.minimumInteritemSpacing = 1.0;//item 之间的行的距离
    flowLayout.minimumLineSpacing = 1.0;//item 之间竖的距离
    flowLayout.itemSize = (CGSize){photoSize,photoSize};
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.photoCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) collectionViewLayout:flowLayout];
    [self.photoCollection registerClass:[JTBPhotoListCell class] forCellWithReuseIdentifier:@"JTBPhotoListCell"];
    self.photoCollection.delegate = self;
    self.photoCollection.dataSource = self;
    self.photoCollection.backgroundColor = [UIColor whiteColor];
    [self.photoCollection setUserInteractionEnabled:YES];
    self.photoCollection.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.photoCollection];
    [self.photoCollection reloadData];
    
}

#pragma UICollectionView --- Datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photoArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    JTBPhotoListCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JTBPhotoListCell" forIndexPath:indexPath];
    
    
    photoCell.selectBlock = ^(){
        [self selectPhotoAtIndex:indexPath.row];
    };
    
    [photoCell updatePhotoItem:[self.photoArray objectAtIndex:indexPath.row]];
    
    return photoCell;
}
#pragma UICollectionView --- Delegate

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     *   此功能未完成，待后期完善。
     */
    //    [self.browserDataArray removeAllObjects];
    //    [self.browserDataArray addObjectsFromArray:self.photoArray];
    //    self.browserController.indexPath = indexPath;
    //    [self.browserController showIn:self animation:ShowAnimationOfPresent];
    //    [self.browserController reloadData];
}

#pragma mark 关键位置，选中的在数组中添加，取消的从数组中减少
-(void)selectPhotoAtIndex:(NSInteger)index
{
    JTBPhotoModel *photo = [self.photoArray objectAtIndex:index];
    
    if (photo != nil) {
        if (photo.isSelect == NO) {
            photo.isSelect = YES;
            [self.selectArray addObject:[self.photoArray objectAtIndex:index]];
        }else{
            photo.isSelect = NO;
            [self.selectArray removeObject:[self.photoArray objectAtIndex:index]];
        }
    }
    
}


@end
