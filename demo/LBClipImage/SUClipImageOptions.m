//
//  Shot.m
//  test
//
//  Created by liangbin on 15/5/28.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#define ShortBorderWidth 4.0
#define ShortRadius 100
#define ShotOuterAlpha 0.3
#define ShotBorderColor [UIColor whiteColor]

#import "SUClipImageOptions.h"

@implementation SUClipImageOptions
- (instancetype)init{
    self = [super init];
    if (self) {
        self.shotCenterPoint = CGPointZero;
        self.shotBorderWidth = ShortBorderWidth;
        self.shotBorderColor = ShotBorderColor;
        self.shotOuterAlpha = ShotOuterAlpha;
        self.shotRadius = ShortRadius;
    }
    return self;
}
@end
