//
//  AvatarImageView.m
//  11月28日
//
//  Created by 我是五高你敢信 on 2016/12/2.
//  Copyright © 2016年 我是五高你敢信. All rights reserved.
//

#import "AvatarImageView.h"
static CGRect oldframe;
@implementation AvatarImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

+ (void)ShowImage:(UIImageView *)avatarImage {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *backGroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    backGroundView.backgroundColor = [UIColor blackColor];
    backGroundView.alpha = 0;
    oldframe = [avatarImage convertRect:avatarImage.bounds toView:window];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:oldframe];
    imageView.image = avatarImage.image;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [backGroundView addSubview:imageView];
    [window addSubview:backGroundView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideImage:)];
    [backGroundView addGestureRecognizer:tap];
    
    [UIView animateWithDuration:0.3 animations:^{

        imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        backGroundView.alpha = 1.0;
    }];
    
}

+ (void)hideImage:(UITapGestureRecognizer *)tap {
    UIView *backgroundView=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldframe;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
