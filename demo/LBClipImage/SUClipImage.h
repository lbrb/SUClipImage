//
//  LBClipImage.h
//  test
//
//  Created by liangbin on 15/5/28.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUClipImageOptions.h"

@class UIImageView;


@interface SUClipImage : NSObject

@property (strong,nonatomic) SUClipImageOptions *options;

- (instancetype)initWithOriginalImageView:(UIImageView *)originalImageView originalImage:(UIImage *)originalImage;

//显示遮照层和镜头
- (void)showMaskLayer;

//截图
- (UIImage *)takePicture;
@end
