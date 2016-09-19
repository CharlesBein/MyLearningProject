//
//  WifiListViewController.m
//  MyLearningProject
//
//  Created by CharlesBein on 16/6/15.
//  Copyright © 2016年 卞增斌. All rights reserved.
//

#import "WifiListViewController.h"
#import <NetworkExtension/NEHotspotHelper.h>

@interface WifiListViewController ()

@end

@implementation WifiListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * networkInterfaces = [NEHotspotHelper supportedNetworkInterfaces];
    NSLog(@"Networks %@",networkInterfaces);
    [self scanWifiInfos];
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

#pragma mark- CustomeMethos
-(void)scanWifiInfos{
    NSLog(@"in wifi scan");
    NSMutableDictionary* options = [[NSMutableDictionary alloc] init];
    //NSMutableDictionary* infos = [[NSMutableDictionary alloc] init];
    
    [options setObject:@"meme" forKey:kNEHotspotHelperOptionDisplayName];
    
    dispatch_queue_t queue = dispatch_queue_create("LiyiZhan.WifiDemo", 0);
    
    BOOL returnType = [NEHotspotHelper registerWithOptions:options queue:queue handler:^(NEHotspotHelperCommand * cmd){
        NSLog(@"in block");
        [cmd createResponse:kNEHotspotHelperResultAuthenticationRequired];
        if(cmd.commandType == kNEHotspotHelperCommandTypeEvaluate || cmd.commandType == kNEHotspotHelperCommandTypeFilterScanList){
            
            NSLog(@"bbbb = %lu",cmd.networkList.count);
            for(NEHotspotNetwork* network in cmd.networkList){
                NSString* ssid = network.SSID;
                NSString* bssid = network.BSSID;
                BOOL secure = network.secure;
                BOOL autoJoined = network.autoJoined;
                double signalStrength = network.signalStrength;
                
                NSLog(@"SSID:%@ # BSSID:%@ # SIGNAL:%f ",ssid,bssid,signalStrength);
            }
        }   
    }];
}

@end
