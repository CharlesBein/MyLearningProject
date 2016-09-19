//
//  UserManager.m
//  MyLearningProject
//
//  Created by CharlesBein on 16/8/23.
//  Copyright © 2016年 卞增斌. All rights reserved.
//单例实现参考网址：http://www.cocoachina.com/applenews/devnews/2013/0510/6168.html
//http://www.cocoachina.com/ios/20160613/16661.html
//

#import "UserManager.h"

@implementation UserManager

//使用gcd创建单例
static id _instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+(instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];// assignment not done here  该方法会调用 allocWithZone
//        sharedManager = [[super allocWithZone:NULL] init];  // assignment not done here  该方法会调用 allocWithZone
    });
    
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}

/*线程锁的方式创建单例
static MyManagerClass *sharedManager = nil;  //静态实例
+ (MyManagerClass*)sharedInstance
{
    @synchronized(self) {   //为了确保多线程情况下，仍然确保实体的唯一性
        if (sharedManager == nil) {
            sharedManager = [[super allocWithZone:NULL] init];  // assignment not done here  该方法会调用 allocWithZone
        }
    }
    return sharedManager;
}

+ (id)allocWithZone:(NSZone *)zone   //构造方法，如果不存在实例就初始化
{
    @synchronized(self) {
        if (sharedManager == nil) {
            sharedManager = [super allocWithZone:zone];
            return sharedManager;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;//确保copy对象也是唯一
}

 - (id)retain
 {
 return self;//确保计数唯一
 }
 
 - (unsigned)retainCount
 {
 return UINT_MAX;  //denotes an object that cannot be released
 }
 
 /////////////////////////
 - (void)release
 {
 //do nothing
 // 因为实例是静态变量，存放在静态存储区，如果没有人为调用释放函数，该实例一直存在，在程序推出的时候，会有系统来释放静态存储区里面的东西
 //不会调用dealloc等相关函数，写了也不会调用
 }
 
 // 这个dealloc方法永远都不会被调用--因为在程序的生命周期内容，该单例一直都存在。（所以该方法可以不用实现）
 -(void)dealloc
 {
 [shareString release];
 
 [super dealloc];
 }
 
 - (id)autorelease
 {
 return self;
 }
 /////////////////////////
 */



@end
