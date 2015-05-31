//
//  LBMaskLayer.m
//  test
//
//  Created by liangbin on 15/5/28.
//  Copyright (c) 2015年 liangbin. All rights reserved.
//

#import "SUClipImageMaskLayer.h"
#import "SUClipImageOptions.h"

@interface SUClipImageMaskLayer()
@property(strong, nonatomic)SUClipImageOptions *options;

@property (strong, nonatomic) UIBezierPath *shotPath;
@property (strong, nonatomic) UIBezierPath *boundPath;
@property (assign, nonatomic) BOOL qingkong;
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
    
    return self;
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
    if (self.qingkong) {
        CGContextClearRect(context, rect);
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint curP =[touch locationInView:self];
    self.options.shotCenterPoint = CGPointMake(curP.x, curP.y);
    [self setNeedsDisplay];
}


@end
