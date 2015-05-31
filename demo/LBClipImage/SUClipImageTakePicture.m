//
//  LBTakePicture.m
//  test
//
//  Created by liangbin on 15/5/28.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import "SUClipImageTakePicture.h"

@implementation SUClipImageTakePicture

+ (UIImage *)takePictueWithImage:(UIImage *)image clipRect:(CGRect)rect outputSize:(CGSize)size
{
    //截图
    UIImage *newImage = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], rect)];
    
    //改变图片大小
    if (size.height > 0 && size.width > 0) {
        UIGraphicsBeginImageContext(CGSizeMake(75, 75));
        [newImage drawInRect:CGRectMake(0, 0, 75, 75)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    return newImage;

}

@end
