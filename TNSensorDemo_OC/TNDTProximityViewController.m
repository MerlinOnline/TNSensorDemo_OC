//
//  TNDTProximityViewController.m
//  TNSensorDemo_OC
//
//  Created by merrill on 2017/10/16.
//  Copyright © 2017年 merrill. All rights reserved.
//

#import "TNDTProximityViewController.h"

@interface TNDTProximityViewController ()

@end

@implementation TNDTProximityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    // 监听有物品靠近还是离开
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateDidChange) name:UIDeviceProximityStateDidChangeNotification object:nil];
}

- (void)proximityStateDidChange
{
    if ([UIDevice currentDevice].proximityState) {
        NSLog(@"有物品靠近");
    } else {
        NSLog(@"有物品离开");
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [UIDevice currentDevice].proximityMonitoringEnabled = NO;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:nil];
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

@end
