//
//  TNCMPedometerViewController.m
//  TNSensorDemo_OC
//
//  Created by merrill on 2017/10/16.
//  Copyright © 2017年 merrill. All rights reserved.
//

#import "TNCMPedometerViewController.h"

#import <CoreMotion/CoreMotion.h>

@interface TNCMPedometerViewController ()

@property (weak, nonatomic) IBOutlet UILabel *stepLabel;

@end

@implementation TNCMPedometerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    if (![CMPedometer isStepCountingAvailable]) {
        NSLog(@"计步器不可用");
        return;
    }
    
    CMPedometer *stepCounter = [[CMPedometer alloc] init];
    [stepCounter startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData *pedometerData, NSError *error) {
        if (error) return;
        // 4.获取采样数据
        NSLog(@"steps = %@", pedometerData.numberOfSteps);
        _stepLabel.text = [pedometerData.numberOfSteps stringValue];
    }];
    
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
