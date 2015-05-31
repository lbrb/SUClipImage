//
//  LBClipImage.m
//  test
//
//  Created by liangbin on 15/5/28.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import "SUClipImage.h"
#import "SUClipImageMaskLayer.h"
#import "SUClipImageTakePicture.h"

@interface SUClipImage()

@property (strong, nonatomic) UIImageView *originalImageView;
@property (strong, nonatomic) UIImage *originalImage;

@end

@implementation SUClipImage

- (instancetype)initWithOriginalImageView:(UIImageView *)originalImageView originalImage:(UIImage *)originalImage;
{
    self = [super init];
    if (self) {
        self.options = [[SUClipImageOptions alloc]init];
        self.originalImageView = originalImageView;
        self.originalImage = originalImage;
        self.options.shotCenterPoint = CGPointMake(self.originalImageView.frame.size.width/2.0, self.originalImageView.frame.size.height/2.0);
        
    }
    return self;
}

//显示遮照层和镜头
- (void)showMaskLayer
{
    SUClipImageMaskLayer *maskLayer = [[SUClipImageMaskLayer alloc] initWithRect:self.originalImageView.frame options:self.options];
    [self.originalImageView.superview addSubview:maskLayer];
}


//截图
- (UIImage *)takePicture
{
    CGFloat scaleRadio = self.originalImage.size.height/self.originalImageView.frame.size.height;
    CGFloat clipX = (self.options.shotCenterPoint.x - self.options.shotRadius) * scaleRadio * self.originalImage.scale;
    CGFloat clipY = (self.options.shotCenterPoint.y - self.options.shotRadius) * scaleRadio * self.originalImage.scale;
    CGFloat clipWidth = self.options.shotRadius * scaleRadio * self.originalImage.scale * 2.0;
    CGFloat clipHeight = clipWidth;
    CGRect clipRect = CGRectMake(clipX, clipY, clipWidth, clipHeight);
    
    return [SUClipImageTakePicture takePictueWithImage:self.originalImage clipRect:clipRect outputSize:self.options.outputSize];
}
@end
