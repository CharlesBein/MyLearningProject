//
//  LoginModel.h
//  MyLearningProject
//
//  Created by CharlesBein on 16/3/30.
//  Copyright © 2016年 卞增斌. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum:NSInteger {
    Login_Successs,         //登录成功
    Login_Password_Error,   //密码错误
    Login_Account_None,     //账号不存在
    Login_Other_Error       //其他错误
}LoginResult;

@interface LoginModel : NSObject

//用户登录
+(void)login:(NSString *)accountString password:(NSString *)passwordString successBlock:(void(^)())success failureBlock:(void(^)(LoginResult loginResult))failureResult;

@end
