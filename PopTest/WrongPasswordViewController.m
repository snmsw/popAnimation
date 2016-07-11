//
//  WrongPasswordViewController.m
//  PopTest
//
//  Created by king on 16/7/10.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "WrongPasswordViewController.h"
#import <pop/POP.h>

@interface WrongPasswordViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation WrongPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Wrong Password";
    [self setupUI];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField endEditing:YES];
    
}

- (void)setupUI {
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 100, 350, 30)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.layer.borderWidth = 0.5;
    self.textField.layer.cornerRadius = 8;
    self.textField.placeholder = @"type password";
    [self.view addSubview:self.textField];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake((self.view.frame.size.width - 60) / 2, 200, 60, 30);
    [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor redColor];
    loginBtn.titleLabel.textColor = [UIColor whiteColor];
    [loginBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
}

- (void)buttonClick:(id)sender {
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    springAnimation.springBounciness = 20;
    springAnimation.velocity = @(3000);
    [self.textField.layer pop_addAnimation:springAnimation forKey:@"wrongPassword"];
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
