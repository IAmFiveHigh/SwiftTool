//
//  ZipImage.h
//  zipImage
//
//  Created by 每天农资 on 2017/6/5.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZipImage : NSObject

    
+ (NSData *)zipImageWithImage:(UIImage *)image;
    
+ (UIImage *)compressImage:(UIImage *)image newWidth:(CGFloat)newImageWidth;
    
@end
