//
//  XZCoreDataTool.h
//  CoreData的使用
//
//  Created by 李志伟 on 15/4/1.
//  Copyright (c) 2015年 李志伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XZCoreData.h"

@interface XZCoreDataTool : NSObject

/**
 *  查询实体
 *
 *  @param entityName 实体的名称
 *
 *  @return 返回这个实体的数组
 */
+(NSMutableArray*)getEntityWithName:(NSString*)entityName;

/**
 *  创建一个实体
 *
 *  @param entityName 实体的名字
 *  @param attribute  实体的属性和对应的值
 */
+(void)creatEntityWithName:(NSString *)entityName AndAttribute:(NSDictionary *)attribute;

/**
 *  删除一个实体
 *
 *  @param entityName 实体名称
 *  @param index      实体的索引
 */
+(void)deleteEntityWithName:(NSString*)entityName AndIndex:(NSUInteger)index;

/**
 *  更新某个实体
 *
 *  @param entityName 实体名
 *  @param attribute  需要更新的实体的对应属性和值
 *  @param index      实体的索引
 */
+(void)updateEntityWithName:(NSString *)entityName AndAttribute:(NSDictionary*)attribute AtIndex:(NSUInteger)index;


/**
 *  根据条件抓取实体
 *
 *  @param entityName 实体名
 *  @param request    查询条件
 *
 *  @return 返回符合条件的实体
 */
+(NSMutableArray*)getEntityWithName:(NSString*)entityName AndFetchRequest:(NSFetchRequest*)request;
@end
