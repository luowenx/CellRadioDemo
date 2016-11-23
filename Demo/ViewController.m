//
//  ViewController.m
//  Demo
//
//  Created by luowenx on 2016/11/23.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "DataModel.h"
static NSString *cellID = @"cell";
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray *dataArray;


@end

@implementation ViewController{
    UITableView *_tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _dataArray = [DataModel arrayModel];
        [_tableView reloadData];
    });

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.model = _dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataModel *model = _dataArray[indexPath.row];
    return model.cellHigh;
}


@end
