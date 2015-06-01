//
//  LBMaskLayer.m
//  test
//
//  Created by liangbin on 15/5/28.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import "SUClipImageMaskLayer.h"
#import "SUClipImageOptions.h"

@interface SUClipImageMaskLayer() <UIGestureRecognizerDelegate>
@property(strong, nonatomic)SUClipImageOptions *options;

@property (strong, nonatomic) UIBezierPath *shotPath;
@property (strong, nonatomic) UIBezierPath *boundPath;
@end

@implementation SUClipImageMaskLayer

- (instancetype)initWithRect:(CGRect)rect options:(SUClipImageOptions *)options;
{
    self = [super init];
    if (self) {
        self.frame = rect;
        self.options = options;
        self.opaque = NO;
    }
    
    [self addGestures];
    
    return self;
}

- (void)addGestures
{
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureTrigger:)];
    [self addGestureRecognizer:pinchGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureTrigger:)];
    [self addGestureRecognizer:panGesture];
}
//移动
- (void)panGestureTrigger:(UIPanGestureRecognizer *)panGesture
{
    CGPoint panPoint = [panGesture translationInView:self];
    CGFloat x = self.options.shotCenterPoint.x + panPoint.x;
    CGFloat y = self.options.shotCenterPoint.y + panPoint.y;
    //判断越界
    CGFloat radius = self.options.shotRadius;
    x = (x - radius < 0)? radius:x;
    x = (x + radius > self.frame.size.width)? self.frame.size.width-radius:x;
    y = (y - radius < 0)? radius:y;
    y = (y + radius > self.frame.size.height)? self.frame.size.height-radius:y;
    
    self.options.shotCenterPoint = CGPointMake(x, y);
    [panGesture setTranslation:CGPointZero inView:self];
    [self setNeedsDisplay];
}

//缩放
- (void)pinchGestureTrigger:(UIPinchGestureRecognizer *)pinchGesture
{
    CGFloat radius = self.options.shotRadius * pinchGesture.scale;
    
    //判断越界
    CGPoint centerPoint = self.options.shotCenterPoint;
    CGFloat x = centerPoint.x;
    CGFloat y = centerPoint.y;
    
    radius = (x - radius < 0)? x:radius;
    radius = (x + radius > self.frame.size.width)? self.frame.size.width-x:radius;
    radius = (y - radius < 0)? y:radius;
    radius = (y + radius > self.frame.size.height)? self.frame.size.height-y:radius;
    
    self.options.shotRadius = radius;
    [pinchGesture setScale:1.0];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //镜头路径
    
    self.shotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.options.shotCenterPoint.x - self.options.shotRadius, self.options.shotCenterPoint.y - self.options.shotRadius, self.options.shotRadius * 2.0, self.options.shotRadius * 2.0)];
    CGContextAddPath(context, self.shotPath.CGPath);
    [self.options.shotBorderColor set];
    CGContextSetLineWidth(context, self.options.shotBorderWidth);
    CGContextStrokePath(context);
    
    //遮照层
    self.boundPath = [UIBezierPath bezierPathWithRect:self.bounds];
    CGContextAddPath(context, self.shotPath.CGPath);
    CGContextAddPath(context, self.boundPath.CGPath);
    [[UIColor whiteColor] set];
    CGContextSetAlpha(context, self.options.shotOuterAlpha);
    CGContextEOFillPath(context);

}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
@end
