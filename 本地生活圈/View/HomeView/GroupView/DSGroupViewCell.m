//
//  DSGroupViewCell.m
//  本地生活圈
//
//  Created by 任攀 on 15/8/13.
//  Copyright (c) 2015年 任攀. All rights reserved.
//

#import "DSGroupViewCell.h"
#import "DSGroupCollectionViewCell.h"


static NSString *ID = @"DSGroupCollectionViewCell";

@interface DSGroupViewCell () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation DSGroupViewCell

+ (instancetype)groupViewCell
{
    DSGroupViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"DSGroupViewCell" owner:nil options:nil] lastObject];

    return cell;
}

- (void)awakeFromNib {
    
    [self.collectionView registerNib:[UINib nibWithNibName:ID bundle:nil] forCellWithReuseIdentifier:ID];
    // 设置不滚动
    self.collectionView.scrollEnabled = NO;
    
    // 必须设置UICollectionViewFlowLayout
    self.flowLayout.itemSize = CGSizeMake(self.bounds.size.width/4.0, self.bounds.size.height/2.0);
    // 设置间距
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

}

#pragma mark - 重写模型set方法
- (void)setGroupList:(DSGroupList *)groupList
{
    _groupList = groupList;
    
    [self.collectionView reloadData];
}

#pragma mark - 实现数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return self.groupList.list.count;
    
    return 8;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    DSGroupCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];

    if(cell == nil){
    
        cell = [DSGroupCollectionViewCell groupCollectionViewCell];
        
        NSLog(@"jids ");
    }
   
    cell.groupModel = self.groupList.list[indexPath.row];

    return cell;

}


@end












