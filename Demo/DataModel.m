//
//  DataModel.m
//  Demo
//
//  Created by luowenx on 2016/11/23.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (instancetype)initWithTitle:(NSString*)title items:(NSArray*)items
{
    self = [super init];
    if (self) {
        _title = title;
        _items = items;
    }
    return self;
}

+(NSArray *)arrayModel
{
    NSMutableArray *array = @[].mutableCopy;
    {
        DataModel *model = [[DataModel alloc] initWithTitle:@"品牌" items:@[@"品牌一",@"品牌儿",@"品牌三",@"品牌四",@"品牌五"]];
        model.cellHigh = 150;  // 这个高度是根据数据算的，这里只是随便给个高度
        [array addObject:model];
    }
    
    {
        DataModel *model = [[DataModel alloc] initWithTitle:@"种类" items:@[@"种类一",@"种类儿",@"种类三",@"种类四",@"种类五",@"种类六"]];
        model.cellHigh = 150;
        [array addObject:model];
    }

    return array;
}

@end
