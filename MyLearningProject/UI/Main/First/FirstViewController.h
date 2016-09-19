//
//  FirstViewController.h
//  MyLearningProject
//
//  Created by CharlesBein on 16/2/16.
//  Copyright © 2016年 卞增斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak)IBOutlet UITableView *functionsTableView;
@property (nonatomic, strong)NSArray *funListArray;
@end
