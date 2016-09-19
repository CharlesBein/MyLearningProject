//
//  LoginModel.m
//  MyLearningProject
//
//  Created by CharlesBein on 16/3/30.
//  Copyright © 2016年 卞增斌. All rights reserved.
//

#import "LoginModel.h"
#import <AFURLSessionManager.h>
#import <AFHTTPSessionManager.h>

#define DATE_FROMAT_yyyyMMddhhmmss @"yyyyMMddHHmmss"

//登录类型
typedef NS_ENUM(NSInteger,LoginType){
    login_username = 0,//用户名
    login_mobile,//手机号
    login_email//邮箱
    
};

@implementation LoginModel
static id objectOrNull(id object)
{
    return object ?: [NSNull null];
}

#pragma mark - String Properties
+ (NSString *)stringWithFormat:(NSString *)format
{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:nowDate];
}

+ (NSString *)getSequenceId
{
    NSString *dateString = [self stringWithFormat:DATE_FROMAT_yyyyMMddhhmmss];
    NSString *sequenceidStr = [NSString stringWithFormat:@"%@000001", dateString];
    return sequenceidStr;
}

/**
 *  邮箱校验
 *
 *  @param email 邮箱
 *
 *  @return 校验输入的用户名是否为邮箱BOOL
 */
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/**
 *  手机号码校验
 *
 *  @param mobile 手机号码
 *
 *  @return 校验是否是手机号码：由13、15、17、18开头BOOL
 */
+ (BOOL) validateMobile:(NSString *)mobile
{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
    
}

+(void)login:(NSString *)accountString password:(NSString *)passwordString successBlock:(void(^)())success failureBlock:(void(^)(LoginResult loginResult))failureResult{
    
    NSNumber *loginType = [NSNumber numberWithInt:login_username];
    if ([self validateEmail:accountString]) {
        loginType = [NSNumber numberWithInt:login_email];
    }
    if ([self validateMobile:accountString]) {
        loginType = [NSNumber numberWithInt:login_mobile];
    }
    
    NSDictionary *requestBody = @{ @"sequenceId":[self getSequenceId],
                           @"accType" : @"0",
                           @"loginId" : objectOrNull(accountString),
                           @"password" : objectOrNull(passwordString),
                           @"thirdpartyAppId" : objectOrNull(@""),
                           @"thirdpartyAccessToken" : objectOrNull(@""),
                           @"loginType" : objectOrNull(loginType)};
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    
    
    
 /*
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"20131129", @"date", @"1", @"startRecord", @"5", @"len", @"1234567890", @"udid", @"Iphone", @"terminalType", @"213", @"cid", nil];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // post请求
    //    [manager POST:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    //        // 拼接data到请求体，这个block的参数是遵守AFMultipartFormData协议的。
    //
    //    } progress:^(NSProgress * _Nonnull uploadProgress) {
    //        // 这里可以获取到目前的数据请求的进度
    //
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //
    //        // 请求成功，解析数据
    //        NSLog(@"%@", responseObject);
    //
    //        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
    //
    //        NSLog(@"%@", dic);
    //
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //
    //        // 请求失败
    //        NSLog(@"%@", [error localizedDescription]);
    //    }];
    
    // Get请求
    [manager GET:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        // 这里可以获取到目前的数据请求的进度
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功，解析数据
        NSLog(@"%@", responseObject);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        
        NSLog(@"%@", dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 请求失败
        NSLog(@"%@", [error localizedDescription]);
        
    }];
*/
}

@end
