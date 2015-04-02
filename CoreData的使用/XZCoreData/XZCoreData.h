//
//  MyCoreData.h
//  CoreData的使用
//
//  Created by 李志伟 on 15/4/1.
//  Copyright (c) 2015年 李志伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "XZCoreDataSingleton.h"

@interface XZCoreData : NSObject
single_interface(XZCoreData)

// 定义Core Data的3个核心API的属性
@property (readonly, strong, nonatomic) NSManagedObjectContext*
managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator*
persistentStoreCoordinator;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
