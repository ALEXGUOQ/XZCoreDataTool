//
//  ViewController.m
//  CoreData的使用
//
//  Created by 李志伟 on 15/3/30.
//  Copyright (c) 2015年 李志伟. All rights reserved.
//

#import "ViewController.h"
#import "XZCoreData.h"
#import "XZCoreDataTool.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    [self get];
    
  
}

//创建一个实体
-(void)creat{
    
    NSDictionary *dic = @{@"name":@"lizhiwei",@"age":@"24"};
    [XZCoreDataTool creatEntityWithName:@"Person" AndAttribute:dic];
}

//获取实体
-(void)get{
    
    NSArray *persons = [XZCoreDataTool getEntityWithName:@"Person"];
    
    for (Person *p in persons) {
        NSLog(@"name = %@ age = %@",p.name,p.age);
        
    }
}


//更新实体
-(void)updateEntity{
    NSDictionary *dic = @{@"name":@"李志伟"};
    [XZCoreDataTool updateEntityWithName:@"Person" AndAttribute:dic AtIndex:1];
}


//删除一个实体
-(void)updata{
    [XZCoreDataTool deleteEntityWithName:@"Person" AndIndex:1];
}





@end
