# XZCoreDataTool
利用单例+Coredata+KVC封装的一个工具类，最多只需两句代码即可实现Coredata的CRUD操作


导入Coredata.framework

创建属于你的实体 

增：
NSDictionary *dic = @{@"name":@"lizhiwei",@"age":@"24"};
    [XZCoreDataTool creatEntityWithName:@"Person" AndAttribute:dic];
    
删：
    [XZCoreDataTool deleteEntityWithName:@"Person" AndIndex:1];

改：
NSDictionary *dic = @{@"name":@"李志伟"};
    [XZCoreDataTool updateEntityWithName:@"Person" AndAttribute:dic AtIndex:1];
    
查：
NSArray *persons = [XZCoreDataTool getEntityWithName:@"Person"];
