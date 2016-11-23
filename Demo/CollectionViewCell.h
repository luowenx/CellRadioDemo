//
//  CollectionViewCell.h
//  Demo
//
//  Created by luowenx on 2016/11/23.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIButton *itemLabel;

@property (copy, nonatomic) void (^block)();

@end
