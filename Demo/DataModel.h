//
//  DataModel.h
//  Demo
//
//  Created by luowenx on 2016/11/23.
//  Copyright © 2016年 xtkj_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *items;

@property (assign, nonatomic) CGFloat cellHigh;

+(NSArray*)arrayModel;

@end

