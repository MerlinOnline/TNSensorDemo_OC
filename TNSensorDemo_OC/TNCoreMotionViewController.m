//
//  TNCoreMotionViewController.m
//  TNSensorDemo_OC
//
//  Created by merrill on 2017/10/16.
//  Copyright © 2017年 merrill. All rights reserved.
//

#import "TNCoreMotionViewController.h"

#import <CoreMotion/CoreMotion.h>

@interface TNCoreMotionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *xLabel;
@property (weak, nonatomic) IBOutlet UILabel *yLabel;
@property (weak, nonatomic) IBOutlet UILabel *zLabel;
@property (nonatomic, strong) CMMotionManager *mgr; // 保证不死

@end


@implementation TNCoreMotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.判断加速计是否可用
    if (!self.mgr.isAccelerometerAvailable) {
        NSLog(@"加速计不可用");
        return;
    }
    
    // >>>>>>>>>>>>>>>>>> push <<<<<<<<<<<<
    
    // 2.设置采样间隔
    self.mgr.accelerometerUpdateInterval = 0.3;
    
    // 3.开始采样
    [self.mgr startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) { // 当采样到加速计信息时就会执行
        if (error) return;
        
        // 4.获取加速计信息
        CMAcceleration acceleration = accelerometerData.acceleration;
        _xLabel.text = @(acceleration.x).stringValue;
        _yLabel.text = @(acceleration.y).stringValue;
        _zLabel.text = @(acceleration.z).stringValue;
    }];
    
    // >>>>>>>>>>>>>>>>>> pull <<<<<<<<<<<<
    
    // 2.开始采样
//    [self.mgr startAccelerometerUpdates];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 获取加速计信息
    CMAcceleration acceleration = self.mgr.accelerometerData.acceleration;
    _xLabel.text = @(acceleration.x).stringValue;
    _yLabel.text = @(acceleration.y).stringValue;
    _zLabel.text = @(acceleration.z).stringValue;
}


#pragma mark - 懒加载
- (CMMotionManager *)mgr
{
    if (_mgr == nil) {
        _mgr = [[CMMotionManager alloc] init];
    }
    return _mgr;
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
