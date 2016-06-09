//
//  PageControl.m
//  Yello
//
//  Created by Olena Melnyk on 10/1/15.
//  Copyright © 2015 Drive Yello. All rights reserved.
//

#import "PageControl.h"

#define kDotDiameter 7.0
#define kDotSpacer 7.0

@interface PageControl ()

@property (nonatomic, strong) UIImage* activeImage;
@property (nonatomic, strong) UIImage* inactiveImage;

@end

@implementation PageControl

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    self.activeImage = [UIImage imageNamed:@"active_page"];
    self.inactiveImage = [UIImage imageNamed:@"inactive_page"];
    self.indicatorDiameter = kDotDiameter;
    self.indicatorSpace = kDotSpacer;
    
    return self;
}

- (void)setIndicatorDiameter:(CGFloat)aDiameter
{
    _indicatorDiameter = aDiameter;
    [self setNeedsDisplay];
}

- (void)setIndicatorSpace:(CGFloat)aSpace
{
    _indicatorSpace = aSpace ;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, true);
    
    CGRect currentBounds = self.bounds;
    CGFloat dotsWidth = self.numberOfPages * self.indicatorDiameter + MAX(0, self.numberOfPages-1) * self.indicatorSpace;
    CGFloat x = CGRectGetMidX(currentBounds) - dotsWidth / 2;
    CGFloat y = CGRectGetMidY(currentBounds) - self.indicatorDiameter / 2;
    for (int i = 0; i < _numberOfPages; i++)
    {
        CGRect circleRect = CGRectMake(x, y, self.indicatorDiameter, self.indicatorDiameter);
        if (i == _currentPage) {
            CGContextDrawImage(context, circleRect, self.activeImage.CGImage);
        } else {
            CGContextDrawImage(context, circleRect, self.inactiveImage.CGImage);
        }
        x += self.indicatorDiameter + self.indicatorSpace;
    }
}

- (void)setCurrentPage:(NSInteger)page
{
    _currentPage = page;
    [self setNeedsDisplay];
}

@end
