//
//  CollectionViewCell.m
//  Demo
//
//  Created by luowenx on 2016/11/23.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _itemLabel = [[UIButton alloc] initWithFrame:self.bounds];
        [_itemLabel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_itemLabel setTitleColor:[UIColor redColor] forState:UIControlStateSelected];

        [_itemLabel addTarget:self action:@selector(labelAction) forControlEvents:(UIControlEventTouchUpInside)];
        _itemLabel.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_itemLabel];
        
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)labelAction
{
    if (_block) {
        _block();
    }
}

@end
