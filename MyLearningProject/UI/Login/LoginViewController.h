//
//  LoginViewController.h
//  MyLearningProject
//
//  Created by CharlesBein on 16/3/17.
//  Copyright © 2016年 卞增斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (nonatomic, weak)IBOutlet UIImageView *headImageView;

@property (nonatomic, weak)IBOutlet UIButton *accountIconBtn;
@property (nonatomic, weak)IBOutlet UITextField *accountField;//用户名输入框
@property (nonatomic, weak)IBOutlet UIButton *passwordIconBtn;
@property (nonatomic, weak)IBOutlet UITextField *passwordField;//密码输入框

@property (nonatomic, weak)IBOutlet UIButton *loginButton;//登录按钮

@end
