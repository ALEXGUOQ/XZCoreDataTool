//
//  Person.h
//  CoreData的使用
//
//  Created by 李志伟 on 15/4/1.
//  Copyright (c) 2015年 李志伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * age;

@end
