//
//  ViewController.m
//  01-alert-view
//
//  Created by 旭 on 16/9/1.
//  Copyright © 2016年 旭. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIView *_overlayView;
    UIView *_alertView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _overlayView = [[UIView alloc] initWithFrame:self.view.bounds];
    _overlayView.backgroundColor = [UIColor blackColor];
    _overlayView.alpha = 0.0f;
    [self.view addSubview:_overlayView];
    
    CGFloat alertWH = 250;
    CGRect alertFrame = CGRectMake(self.view.bounds.size.width/2 - alertWH/2, self.view.bounds.size.height/2 - alertWH/2, alertWH, alertWH);
    _alertView = [[UIView alloc] initWithFrame:alertFrame];
//    alertView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"alert_box"]];
    _alertView.backgroundColor = [UIColor whiteColor];
    _alertView.alpha = 0.0f;
    _alertView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    _alertView.layer.cornerRadius = 10;
    
    _alertView.layer.shadowColor = [UIColor blackColor].CGColor;
    _alertView.layer.shadowOffset = CGSizeMake(0, 5);
    _alertView.layer.shadowOpacity = 0.5f;
    _alertView.layer.shadowRadius = 10.0f;
    [self.view addSubview:_alertView];
    
    UIButton *okBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 220, alertWH, 40)];
    [okBtn setTitle:@"ok" forState:UIControlStateNormal];
//    [okBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [okBtn setBackgroundColor:[UIColor colorWithRed:17.9/255 green:142.3/255 blue:10.4/255 alpha:1.0]];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    okBtn.layer.cornerRadius = 5;
    [okBtn addTarget:self action:@selector(hideAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [_alertView addSubview:okBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideAlertView:(id)sender {
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _overlayView.alpha = 0.0f;
        _alertView.alpha = 0.0f;
        _alertView.transform = CGAffineTransformMakeScale(0.7, 0.7);
    } completion:NULL];
}

- (IBAction)showAlertView:(id)sender {
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _overlayView.alpha = 0.3f;
        _alertView.alpha = 1.0f;
        _alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:NULL];
}
@end
