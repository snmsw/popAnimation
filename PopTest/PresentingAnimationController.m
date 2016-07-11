//
//  PresentingAnimationController.m
//  PopTest
//
//  Created by king on 16/7/11.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "PresentingAnimationController.h"
#import <POP.h>

@implementation PresentingAnimationController

//定义转场时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    fromView.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    fromView.userInteractionEnabled = NO;
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0, 0, CGRectGetWidth(transitionContext.containerView.bounds) - 100.f, CGRectGetHeight(transitionContext.containerView.bounds) - 280.f);
    CGPoint p = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    toView.center = p;
    [transitionContext.containerView addSubview:toView];
    
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAnimation.toValue = @(transitionContext.containerView.center.y);
    positionAnimation.springBounciness = 10;
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.springBounciness = 20;
    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];
    [toView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    [fromView.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}




@end
