//
//  ZipImage.m
//  zipImage
//
//  Created by 每天农资 on 2017/6/5.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

#import "ZipImage.h"

@implementation ZipImage

    
    /**
     压图片质量
     
     @param image image
     @return Data
     */
+ (NSData *)zipImageWithImage:(UIImage *)image {
    
        if (!image) {
            return nil;
        }
        CGFloat maxFileSize = 100*1024;
        CGFloat compression = 0.9f;
        NSData *compressedData = UIImageJPEGRepresentation(image, compression);
        while ([compressedData length] > maxFileSize) {
            compression *= 0.9;
            compressedData = UIImageJPEGRepresentation([[self class] compressImage:image newWidth:image.size.width*compression], compression);
        }
        return compressedData;
    }
    
    /**
     *  等比缩放本图片大小
     *
     *  @param newImageWidth 缩放后图片宽度，像素为单位
     *
     *  @return self-->(image)
     */
+ (UIImage *)compressImage:(UIImage *)image newWidth:(CGFloat)newImageWidth {
    
        if (!image) return nil;
        float imageWidth = image.size.width;
        float imageHeight = image.size.height;
        float width = newImageWidth;
        float height = image.size.height/(image.size.width/width);
        
        float widthScale = imageWidth /width;
        float heightScale = imageHeight /height;
        
        // 创建一个bitmap的context
        // 并把它设置成为当前正在使用的context
        UIGraphicsBeginImageContext(CGSizeMake(width, height));
        
        if (widthScale > heightScale) {
            [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
        }
        else {
            [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
        }
        
        // 从当前context中创建一个改变大小后的图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        // 使当前的context出堆栈
        UIGraphicsEndImageContext();
        
        return newImage;
        
    }
@end
