//
//  Cell.m
//  Demo
//
//  Created by luowenx on 2016/11/23.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "Cell.h"
#import "CollectionViewCell.h"
#import "DataModel.h"
static NSString *cellId = @"cellid";
@interface Cell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *rightLabel;

@property (strong, nonatomic) NSArray *itemArray;

@end

@implementation Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 50, 30)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
        _rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width -100 -10, 0, 100, 30)];
        _rightLabel.textColor = [UIColor redColor];
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 10, self.frame.size.width, self.frame.size.height - 30 -10) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellId];
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_rightLabel];
        [self.contentView addSubview:_collectionView];
        
    }
    return self;
}

#pragma mark ===  UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_itemArray count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    [cell.itemLabel setTitle:_itemArray[indexPath.row] forState:(UIControlStateNormal)];
    // 实现单选的方式有很多种
    //    1、
    cell.block = ^(){
        _rightLabel.text = _itemArray[indexPath.row];
        [_collectionView reloadData];
    };
    cell.itemLabel.selected = [cell.itemLabel.titleLabel.text isEqualToString:_rightLabel.text];
//    2、记录indexPath
//    3、绑定数据
    //and so on....
    return cell;
}
#pragma mark ===  UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 实现单选的方式有很多种
//    1、
    _rightLabel.text = _itemArray[indexPath.row];
    [_collectionView reloadData];
}

#pragma mark ===  UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (self.frame.size.width - 10 *2 )/3;
    return CGSizeMake(width, 35);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(void)setModel:(DataModel *)model
{
    _model = model;
    _collectionView.frame = CGRectMake(0, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 10, self.frame.size.width, model.cellHigh - 30 -10);
    _titleLabel.text = model.title;
    _itemArray = model.items;
    [_collectionView reloadData];
}

@end
