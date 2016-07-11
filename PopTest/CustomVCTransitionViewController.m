//
//  CustomVCTransitionViewController.m
//  PopTest
//
//  Created by king on 16/7/10.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "CustomVCTransitionViewController.h"
#import <pop/POP.h>
#import "CustomModelViewController.h"
#import "PresentingAnimationController.h"
#import "DismissingAnimationController.h"

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width


@interface CustomVCTransitionViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation CustomVCTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"Custom VC Transition";
    
    UIButton *presentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    presentBtn.frame = CGRectMake((WIDTH - 80) / 2, (HEIGHT - 40) / 2, 80, 40);
    [presentBtn setTitle:@"Present" forState:UIControlStateNormal];
    [presentBtn addTarget:self action:@selector(presentClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:presentBtn];
    
}

- (void)presentClick:(id)sender {
    
    CustomModelViewController *modelVC = [CustomModelViewController new];
    modelVC.transitioningDelegate = self;
    modelVC.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController presentViewController:modelVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[PresentingAnimationController alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[DismissingAnimationController alloc] init];
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
