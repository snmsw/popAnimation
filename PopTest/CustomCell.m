//
//  CustomCell.m
//  PopTest
//
//  Created by king on 16/7/10.
//  Copyright © 2016年 songs. All rights reserved.
//

#import "CustomCell.h"
#import <pop/POP.h>

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration = 0.1;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleUp"];
    } else {
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9, 0.9)];
        springAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        springAnimation.springBounciness = 20.f;
        [self.textLabel pop_addAnimation:springAnimation forKey:@"springAnimation"];
    }
}



@end
