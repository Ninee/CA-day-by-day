//
//  ViewController.m
//  00-simple-animation
//
//  Created by 旭 on 16/8/31.
//  Copyright © 2016年 旭. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIView *_redBall;
    UIView *_blueBall;
    UIView *_purpleBlock;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _redBall = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    _redBall.backgroundColor = [UIColor redColor];
    _redBall.layer.cornerRadius = 25;
    [self.view addSubview:_redBall];
    
    
    
    _blueBall = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 50, 50)];
    _blueBall.backgroundColor = [UIColor blueColor];
    _blueBall.layer.cornerRadius = 25;
    [self.view addSubview:_blueBall];
    
    
    
    _purpleBlock = [[UIView alloc] initWithFrame:CGRectMake(50, 250, 50, 50)];
    _purpleBlock.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_purpleBlock];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zoomAnimation:(id)sender {
    //弹簧效果
    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:0 options:0 animations:^{
        _blueBall.transform = CGAffineTransformMakeScale(2.0, 2.0);
    } completion:^(BOOL finished) {
        _blueBall.transform = CGAffineTransformIdentity;
    }];
}

- (IBAction)translateAnimation:(id)sender {
    
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //        _redBall.backgroundColor = [UIColor greenColor];
//        _redBall.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(2.0, 2.0), CGAffineTransformMakeTranslation(75.0, 0.0));
        _redBall.transform = CGAffineTransformMakeTranslation(200, 0.0);
    } completion:^(BOOL finished) {
        _redBall.transform = CGAffineTransformIdentity;
    }];
}

- (IBAction)rotateAnimation:(id)sender {
    
    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:0 options:0 animations:^{
        
        _purpleBlock.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(2.0, 2.0), CGAffineTransformMakeRotation(M_PI_2));
    } completion:^(BOOL finished) {
        _purpleBlock.transform = CGAffineTransformIdentity;
    }];
}
@end
