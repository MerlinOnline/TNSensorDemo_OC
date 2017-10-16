//
//  TNAccelerometerViewController.m
//  TNSensorDemo_OC
//
//  Created by merrill on 2017/10/16.
//  Copyright © 2017年 merrill. All rights reserved.
//

#import "TNAccelerometerViewController.h"

#import <CoreMotion/CoreMotion.h>

@interface TNAccelerometerViewController ()<UIAccelerometerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *xLabel;
@property (weak, nonatomic) IBOutlet UILabel *yLabel;
@property (weak, nonatomic) IBOutlet UILabel *zLabel;

@end

@implementation TNAccelerometerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.获取单例对象
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    // 2.设置代理
    accelerometer.delegate = self;
    // 3.设置采样间隔
    accelerometer.updateInterval = 0.3;
    
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    _xLabel.text = @(acceleration.x).stringValue;
    _yLabel.text = @(acceleration.y).stringValue;
    _zLabel.text = @(acceleration.z).stringValue;
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
