//
//  XZCoreDataTool.m
//  CoreData的使用
//
//  Created by 李志伟 on 15/4/1.
//  Copyright (c) 2015年 李志伟. All rights reserved.
//

#import "XZCoreDataTool.h"

@implementation XZCoreDataTool

/**
 *  查询实体
 *
 *  @param entityName 实体的名称
 *
 *  @return 返回这个实体的数组
 */
+(NSMutableArray*)getEntityWithName:(NSString*)entityName{
    XZCoreData *cd = [XZCoreData sharedXZCoreData];
    NSManagedObjectContext *managedObjectContext = [cd managedObjectContext];
    // 创建抓取数据的请求对象
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // 设置要抓取哪种类型的实体
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:managedObjectContext];
    
    // 设置抓取实体
    [request setEntity:entity];
    NSError *error = nil;
    // 执行抓取数据的请求，返回符合条件的数据
    NSMutableArray *entityArray = [[managedObjectContext
                                    executeFetchRequest:request error:&error] mutableCopy];
    
    
    return entityArray;
}


/**
 *  创建一个实体
 *
 *  @param entityName 实体的名字
 *  @param attribute  实体的属性和对应的值
 */
+(void)creatEntityWithName:(NSString *)entityName AndAttribute:(NSDictionary *)attribute{
    
    XZCoreData *cd =[XZCoreData sharedXZCoreData];
    NSManagedObjectContext *managedObjectContext = [cd managedObjectContext];
    NSError *error = nil;
    
    
    id entity = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:managedObjectContext];
    
    //利用KVC实现
    if (attribute) {
        NSArray *keys = [attribute allKeys];
        for (NSString *key in keys) {
            [entity setValue:[attribute valueForKeyPath:key] forKeyPath:key];
        }
    }
    
    
    if ([managedObjectContext save:&error]) {
        //                    NSLog(@"实体保存成功!");
    }else{
        NSLog(@"保存实体出现error:%@",error);
        
    }
    
}


/**
 *  删除一个实体
 *
 *  @param entityName 实体名称
 *  @param index      实体的索引
 */
+(void)deleteEntityWithName:(NSString*)entityName AndIndex:(NSUInteger)index{
    
    NSArray *entityArray = [XZCoreDataTool getEntityWithName:entityName];
    NSManagedObjectContext *context = [XZCoreData sharedXZCoreData].managedObjectContext;
    
    if (entityArray.count>0) {
        
        NSAssert(index < entityArray.count, @"删除实体的时候数组越界");
        [context deleteObject:entityArray[index]];
        
        NSError *error = nil;
        if ([context save:&error]) {
            
            NSLog(@"删除成功");
        }else{
            NSLog(@"删除失败error-->>%@",error);
        }
    }
    
    //    NSLog(@"当前数组长度：%lu",(unsigned long)entityArray.count);
    
}


/**
 *  更新某个实体
 *
 *  @param entityName 实体名
 *  @param attribute  需要更新的实体的对应属性和值
 *  @param index      实体的索引
 */
+(void)updateEntityWithName:(NSString *)entityName AndAttribute:(NSDictionary*)attribute AtIndex:(NSUInteger)index{
    
    NSMutableArray *entityArray = [XZCoreDataTool getEntityWithName:entityName];
    NSManagedObjectContext *context = [XZCoreData sharedXZCoreData].managedObjectContext;
    
    if (entityArray.count > 0) {
        
        NSAssert(index < entityArray.count, @"更新实体的时候数组越界");
        id entity = entityArray[index];
        
        NSArray *keys = [attribute allKeys];
        for (NSString *key in keys) {
            [entity setValue:[attribute valueForKeyPath:key] forKeyPath:key];
        }
        
        NSError *error = nil;
        BOOL flag = [context save:&error];
        if (flag) {
            
            //            NSLog(@"更新成功");
            
        }else{
            
            //            NSLog(@"更新失败");
            
        }
    }
    
}

/**
 *  根据条件抓取实体
 *
 *  @param entityName 实体名
 *  @param request    查询条件
 *
 *  @return 返回符合条件的实体
 */
+(NSMutableArray*)getEntityWithName:(NSString*)entityName AndFetchRequest:(NSFetchRequest*)request{
    XZCoreData *cd = [XZCoreData sharedXZCoreData];
    NSManagedObjectContext *managedObjectContext = [cd managedObjectContext];
    
    
    
    
    // 设置要抓取哪种类型的实体
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:managedObjectContext];
    
    // 设置抓取实体
    [request setEntity:entity];
    NSError *error = nil;
    // 执行抓取数据的请求，返回符合条件的数据
    NSMutableArray *entityArray = [[managedObjectContext
                                    executeFetchRequest:request error:&error] mutableCopy];
    
    if (error) {
        NSLog(@"error = %@",error);
    }
    
    
    return entityArray;
}







@end
