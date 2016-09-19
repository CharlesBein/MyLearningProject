//
//  LoginViewController.m
//  MyLearningProject
//
//  Created by CharlesBein on 16/3/17.
//  Copyright © 2016年 卞增斌. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginModel.h"
#import "MLTabbarViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    
    [_loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchDown];
    [_accountField addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventAllEvents];
    [_passwordField addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventAllEvents];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textfieldresignFirstResponder:)];
    [self.view addGestureRecognizer:tap];
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
}

#pragma mark - Custome Methods
-(void)initView{
    self.accountField.text=@"admin";
    self.passwordField.text =@"limin9969";
}

//UITextField  UITapGestureRecognizer Event
- (void)textfieldresignFirstResponder:(UIGestureRecognizer *)sender{
    
    [self.accountField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

-(void)turnToTabbarViewCotrroller{
    MLTabbarViewController *tabbarViewController = [[MLTabbarViewController alloc]init];
    tabbarViewController.modalTransitionStyle= UIModalTransitionStyleCrossDissolve;
    [self presentViewController:tabbarViewController animated:YES completion:nil];
}

#pragma mark- 监听UITextField改变
-(void)textFieldDidChange
{
    if([self.accountField.text length]>0){
        self.accountIconBtn.selected =YES;
    }else{
        self.accountIconBtn.selected =NO
        ;
    }
    
    if([self.passwordField.text length]>0){
        self.passwordIconBtn.selected =YES;
    }else{
        self.passwordIconBtn.selected =NO
        ;
    }
}

#pragma mark- IBAction
-(void)loginButtonClick:(UIButton *)loginBtn{
    
    [LoginModel login:self.accountField.text password:self.passwordField.text successBlock:^{
        [self turnToTabbarViewCotrroller];
    } failureBlock:^(LoginResult loginResult) {
        NSLog(@"");
    }];
}

-(IBAction)skipButtonClick:(id)sender{
    [self turnToTabbarViewCotrroller];
}
@end
