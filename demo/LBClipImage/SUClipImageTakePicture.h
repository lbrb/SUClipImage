//
//  LBTakePicture.h
//  test
//
//  Created by liangbin on 15/5/28.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SUClipImageOptions.h"

@interface SUClipImageTakePicture : NSObject

/**
 *  截取图片
 *
 *  @param image 图片
 *  @param clipRect  截取的范围
 *  @param size  截取后返回多大的图片，默认为rect.size
 *
 *  @return 截取后的图片
 */
+ (UIImage *)takePictueWithImage:(UIImage *)image clipRect:(CGRect)rect outputSize:(CGSize)size;

@end
