//
//  FirstViewController.m
//  MyLearningProject
//
//  Created by CharlesBein on 16/2/16.
//  Copyright © 2016年 卞增斌. All rights reserved.
//

#import "FirstViewController.h"
#import "WifiListViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //table 数据初始化
    _funListArray = [[NSMutableArray alloc]initWithObjects:
                       @"获取WifiList",
                       @"UIWebView",
                       nil];
    //table 配置
    //self.funTableView.backgroundColor = [UIColor clearColor];
    self.functionsTableView.delegate = self;
    self.functionsTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- UITableView  DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_funListArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierCell = @"identifierCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierCell];
    if(cell ==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierCell] ;
        
        //使tableviewcell 背景透明
        cell.backgroundColor = [UIColor clearColor];
    }
    
    cell.textLabel.text = [_funListArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark- UITableView Delegate
//设置每行缩进级别
- (NSInteger) tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row>1&&indexPath.row<=3)
    {
        return 1;
    }
    if(indexPath.row>3&&indexPath.row<=5)
    {
        return 2;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    if(row ==0){
        //TODO:pickerView  使用
        WifiListViewController *wifilistView = [[WifiListViewController alloc]init];
        [self.navigationController pushViewController:wifilistView animated:YES];
        //        [self presentViewController:hueView animated:YES completion:nil];
    }else if(row ==1){

    }
}

@end
