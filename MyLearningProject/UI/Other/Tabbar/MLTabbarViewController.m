//
//  MLTabbarViewController.m
//  MyLearningProject
//
//  Created by CharlesBein on 16/2/16.
//  Copyright © 2016年 卞增斌. All rights reserved.
//

#import "MLTabbarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"

@interface MLTabbarViewController ()

@end

@implementation MLTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabbarItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark- Create TabbarItem Views
-(void)initTabbarItem
{
    FirstViewController *firstViewController= [[FirstViewController alloc]init];
    [self controller:firstViewController title:@"First" image:@"first_normal" selectedimage:@"first_selected"];
    
    SecondViewController *secondeViewController= [[SecondViewController alloc]init];
    [self controller:secondeViewController title:@"Second" image:@"second_normal" selectedimage:@"second_selected"];
    
    ThreeViewController *threeViewController= [[ThreeViewController alloc]init];
    [self controller:threeViewController title:@"Three" image:@"third_normal" selectedimage:@"third_selected"];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:navigationBarColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

   /* //去掉tabbar顶部的横线，需要有一个合适的背景图片
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
   [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_normal_background"]];
    */
}

//初始化一个控制器
-(void)controller:(UIViewController *)itemController title:(NSString *)title image:(NSString *)image selectedimage:(NSString *)selectedimage
{
    itemController.tabBarItem.title = title;
    itemController.tabBarItem.image = [UIImage imageNamed:image];
    itemController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:itemController];
    [self addChildViewController:nav];
    
    /*
    //字体颜色 大小
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica" size:14.0f],NSFontAttributeName,nil];
    [itemController.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],
                           NSForegroundColorAttributeName,[UIFont fontWithName:@"Helvetica" size:30.0f],NSFontAttributeName,nil];
    [itemController.tabBarItem setTitleTextAttributes:dict2 forState:UIControlStateSelected];*/
}


@end
