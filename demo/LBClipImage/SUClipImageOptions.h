//
//  Shot.h
//  test
//
//  Created by liangbin on 15/5/28.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SUClipImageOptions : NSObject

@property (nonatomic, assign)CGPoint shotCenterPoint;   //镜头的中点位置 默认图片中点位置
@property (nonatomic, assign)CGFloat shotBorderWidth;   //镜头边框宽度 默认2像素
@property (strong, nonatomic) UIColor *shotBorderColor; //镜头边框颜色 默认白色
@property (nonatomic, assign)CGFloat shotOuterAlpha;    //镜头外部透明度 默认0.3
@property (nonatomic, assign)CGFloat shotRadius;        //镜头的半径  默认为长宽中较小值的一半
@property (nonatomic, assign)CGSize outputSize;           //定义输出图片的大小，默认镜头在原图中的大小

- (instancetype)init;
@end
