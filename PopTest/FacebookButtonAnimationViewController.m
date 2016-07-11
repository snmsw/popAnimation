//
//  FacebookButtonAnimationViewController.m
//  PopTest
//
//  Created by king on 16/7/10.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "FacebookButtonAnimationViewController.h"
#import <pop/POP.h>

@interface FacebookButtonAnimationViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *msgTextField;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *sendButton;


@end

@implementation FacebookButtonAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Facebook Like and Send";
    [self setupUI];
    self.sendButton.hidden = YES;
    self.msgTextField.delegate = self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.msgTextField endEditing:YES];
}

- (void)setupUI {
    
    //setup textFeild
    self.msgTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 300, 30)];
    self.msgTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.msgTextField.layer.borderWidth = 0.5;
    self.msgTextField.layer.cornerRadius = 5;
    self.msgTextField.placeholder = @"Type your message...";
    
    [self.view addSubview:self.msgTextField];
    
    // setup Like button and Send button
    self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sendButton.frame = CGRectMake(350, 160, 60, 20);
//    self.sendButton.
    [self.sendButton setTitle:@"Send" forState:UIControlStateNormal];
    self.sendButton.titleLabel.textColor = [UIColor blueColor];
    [self.view addSubview:self.sendButton];
    
    self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likeButton.frame = CGRectMake(350, 160, 20, 20);
    [self.likeButton setImage:[UIImage imageNamed:@"likeClick"] forState:UIControlStateNormal];
    [self.view addSubview:self.likeButton];
    
}

#pragma mark - <UITextFeildDelegate>

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *comment;
    
    if (range.length == 0) {
        comment = [NSString stringWithFormat:@"%@%@", textField.text, string];
//        NSLog(@"---------->range.length == 0");
    } else {
        comment = [textField.text substringToIndex:textField.text.length - range.length];
//        NSLog(@"-------->rang.length > 0");
    }
    
    if (comment.length == 0) {
        // Show Like
        [self showLikeButton];
//        NSLog(@"---------->showLikeButton");
    } else {
        // Show Send
        [self showSendButton];
//        NSLog(@"---------->showSendButton");
    }
    
    
    return YES;
}

- (void)showSendButton {
    if (self.sendButton.isHidden) {
        
        self.sendButton.hidden = NO;
        self.likeButton.hidden = YES;
        
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        
        springAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(8, 8)];
        springAnimation.springBounciness = 20.f;
        [self.sendButton pop_addAnimation:springAnimation forKey:@"sendAnimation"];
//        NSLog(@"==========>showSendButton");
    }
}

- (void)showLikeButton {
    self.likeButton.hidden = NO;
    self.sendButton.hidden = YES;
    
    POPSpringAnimation *spin = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    spin.fromValue = @(M_PI / 4);
    spin.toValue = @(0);
    spin.springBounciness = 20;
    spin.velocity = @(10);
    [self.likeButton.layer pop_addAnimation:spin forKey:@"likeAnimation"];
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
