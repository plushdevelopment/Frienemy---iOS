//
//  SmallerStalkButton.m
//  Frienemy
//
//  Created by Ross Chapman on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SmallerStalkButton.h"

@implementation SmallerStalkButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if (self.stalking) {
        //// General Declarations
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //// Color Declarations
        UIColor* upColorOut = [UIColor colorWithRed: 0.79 green: 0.79 blue: 0.79 alpha: 1];
        UIColor* bottomColorDown = [UIColor colorWithRed: 0.21 green: 0.21 blue: 0.21 alpha: 1];
        UIColor* upColorInner = [UIColor colorWithRed: 0.17 green: 0.18 blue: 0.2 alpha: 1];
        UIColor* bottomColorInner = [UIColor colorWithRed: 0.98 green: 0.98 blue: 0.99 alpha: 1];
        UIColor* buttonColor = [UIColor colorWithRed: 0.13 green: 0.65 blue: 0.98 alpha: 1];
        CGFloat buttonColorRGBA[4];
        [buttonColor getRed: &buttonColorRGBA[0] green: &buttonColorRGBA[1] blue: &buttonColorRGBA[2] alpha: &buttonColorRGBA[3]];
        
        UIColor* buttonTopColor = [UIColor colorWithRed: (buttonColorRGBA[0] * 0.8) green: (buttonColorRGBA[1] * 0.8) blue: (buttonColorRGBA[2] * 0.8) alpha: (buttonColorRGBA[3] * 0.8 + 0.2)];
        UIColor* buttonBottomColor = [UIColor colorWithRed: (buttonColorRGBA[0] * 0 + 1) green: (buttonColorRGBA[1] * 0 + 1) blue: (buttonColorRGBA[2] * 0 + 1) alpha: (buttonColorRGBA[3] * 0 + 1)];
        UIColor* flareWhite = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.83];
        
        //// Gradient Declarations
        NSArray* ringGradientColors = [NSArray arrayWithObjects: 
                                       (id)upColorOut.CGColor, 
                                       (id)bottomColorDown.CGColor, nil];
        CGFloat ringGradientLocations[] = {0, 1};
        CGGradientRef ringGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)ringGradientColors, ringGradientLocations);
        NSArray* ringInnerGradientColors = [NSArray arrayWithObjects: 
                                            (id)upColorInner.CGColor, 
                                            (id)bottomColorInner.CGColor, nil];
        CGFloat ringInnerGradientLocations[] = {0, 1};
        CGGradientRef ringInnerGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)ringInnerGradientColors, ringInnerGradientLocations);
        NSArray* buttonGradientColors = [NSArray arrayWithObjects: 
                                         (id)buttonBottomColor.CGColor, 
                                         (id)buttonTopColor.CGColor, nil];
        CGFloat buttonGradientLocations[] = {0, 1};
        CGGradientRef buttonGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)buttonGradientColors, buttonGradientLocations);
        NSArray* overlayGradientColors = [NSArray arrayWithObjects: 
                                          (id)flareWhite.CGColor, 
                                          (id)[UIColor clearColor].CGColor, nil];
        CGFloat overlayGradientLocations[] = {0, 1};
        CGGradientRef overlayGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)overlayGradientColors, overlayGradientLocations);
        
        //// Shadow Declarations
        CGColorRef buttonInnerShadow = [UIColor blackColor].CGColor;
        CGSize buttonInnerShadowOffset = CGSizeMake(0, -0);
        CGFloat buttonInnerShadowBlurRadius = 5;
        CGColorRef buttonOuterShadow = [UIColor blackColor].CGColor;
        CGSize buttonOuterShadowOffset = CGSizeMake(0, 2);
        CGFloat buttonOuterShadowBlurRadius = 5;
        
        
        //// outerOval Drawing
        UIBezierPath* outerOvalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 19, 19)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, buttonOuterShadowOffset, buttonOuterShadowBlurRadius, buttonOuterShadow);
        CGContextSetFillColorWithColor(context, buttonOuterShadow);
        [outerOvalPath fill];
        [outerOvalPath addClip];
        CGContextDrawLinearGradient(context, ringGradient, CGPointMake(9.5, -0), CGPointMake(9.5, 19), 0);
        CGContextRestoreGState(context);
        
        
        
        //// overlayOval Drawing
        UIBezierPath* overlayOvalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 19, 19)];
        CGContextSaveGState(context);
        [overlayOvalPath addClip];
        CGContextDrawRadialGradient(context, overlayGradient,
                                    CGPointMake(9.5, -14.77), 17.75,
                                    CGPointMake(9.5, 9.5), 44.61,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        
        //// innerOval Drawing
        UIBezierPath* innerOvalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(2, 2, 15, 15)];
        CGContextSaveGState(context);
        [innerOvalPath addClip];
        CGContextDrawLinearGradient(context, ringInnerGradient, CGPointMake(9.5, 2), CGPointMake(9.5, 17), 0);
        CGContextRestoreGState(context);
        
        
        
        //// buttonOval Drawing
        UIBezierPath* buttonOvalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(4, 3, 12, 12)];
        CGContextSaveGState(context);
        [buttonOvalPath addClip];
        CGContextDrawRadialGradient(context, buttonGradient,
                                    CGPointMake(10, 36.23), 2.44,
                                    CGPointMake(10, 17.48), 23.14,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        ////// buttonOval Inner Shadow
        CGRect buttonOvalBorderRect = CGRectInset([buttonOvalPath bounds], -buttonInnerShadowBlurRadius, -buttonInnerShadowBlurRadius);
        buttonOvalBorderRect = CGRectOffset(buttonOvalBorderRect, -buttonInnerShadowOffset.width, -buttonInnerShadowOffset.height);
        buttonOvalBorderRect = CGRectInset(CGRectUnion(buttonOvalBorderRect, [buttonOvalPath bounds]), -1, -1);
        
        UIBezierPath* buttonOvalNegativePath = [UIBezierPath bezierPathWithRect: buttonOvalBorderRect];
        [buttonOvalNegativePath appendPath: buttonOvalPath];
        buttonOvalNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = buttonInnerShadowOffset.width + round(buttonOvalBorderRect.size.width);
            CGFloat yOffset = buttonInnerShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        buttonInnerShadowBlurRadius,
                                        buttonInnerShadow);
            
            [buttonOvalPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(buttonOvalBorderRect.size.width), 0);
            [buttonOvalNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [buttonOvalNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        
        
        //// Cleanup
        CGGradientRelease(ringGradient);
        CGGradientRelease(ringInnerGradient);
        CGGradientRelease(buttonGradient);
        CGGradientRelease(overlayGradient);
        CGColorSpaceRelease(colorSpace);
    } else {
        //// General Declarations
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        //// Color Declarations
        UIColor* upColorOut = [UIColor colorWithRed: 0.79 green: 0.79 blue: 0.79 alpha: 1];
        UIColor* bottomColorDown = [UIColor colorWithRed: 0.21 green: 0.21 blue: 0.21 alpha: 1];
        UIColor* upColorInner = [UIColor colorWithRed: 0.17 green: 0.18 blue: 0.2 alpha: 1];
        UIColor* bottomColorInner = [UIColor colorWithRed: 0.98 green: 0.98 blue: 0.99 alpha: 1];
        UIColor* buttonColor = [UIColor colorWithRed: 0.65 green: 0.65 blue: 0.65 alpha: 1];
        CGFloat buttonColorRGBA[4];
        [buttonColor getRed: &buttonColorRGBA[0] green: &buttonColorRGBA[1] blue: &buttonColorRGBA[2] alpha: &buttonColorRGBA[3]];
        
        UIColor* buttonTopColor = [UIColor colorWithRed: (buttonColorRGBA[0] * 0.8) green: (buttonColorRGBA[1] * 0.8) blue: (buttonColorRGBA[2] * 0.8) alpha: (buttonColorRGBA[3] * 0.8 + 0.2)];
        UIColor* buttonBottomColor = [UIColor colorWithRed: (buttonColorRGBA[0] * 0 + 1) green: (buttonColorRGBA[1] * 0 + 1) blue: (buttonColorRGBA[2] * 0 + 1) alpha: (buttonColorRGBA[3] * 0 + 1)];
        UIColor* flareWhite = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.83];
        
        //// Gradient Declarations
        NSArray* ringGradientColors = [NSArray arrayWithObjects: 
                                       (id)upColorOut.CGColor, 
                                       (id)bottomColorDown.CGColor, nil];
        CGFloat ringGradientLocations[] = {0, 1};
        CGGradientRef ringGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)ringGradientColors, ringGradientLocations);
        NSArray* ringInnerGradientColors = [NSArray arrayWithObjects: 
                                            (id)upColorInner.CGColor, 
                                            (id)bottomColorInner.CGColor, nil];
        CGFloat ringInnerGradientLocations[] = {0, 1};
        CGGradientRef ringInnerGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)ringInnerGradientColors, ringInnerGradientLocations);
        NSArray* buttonGradientColors = [NSArray arrayWithObjects: 
                                         (id)buttonBottomColor.CGColor, 
                                         (id)buttonTopColor.CGColor, nil];
        CGFloat buttonGradientLocations[] = {0, 1};
        CGGradientRef buttonGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)buttonGradientColors, buttonGradientLocations);
        NSArray* overlayGradientColors = [NSArray arrayWithObjects: 
                                          (id)flareWhite.CGColor, 
                                          (id)[UIColor clearColor].CGColor, nil];
        CGFloat overlayGradientLocations[] = {0, 1};
        CGGradientRef overlayGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)overlayGradientColors, overlayGradientLocations);
        
        //// Shadow Declarations
        CGColorRef buttonInnerShadow = [UIColor blackColor].CGColor;
        CGSize buttonInnerShadowOffset = CGSizeMake(0, -0);
        CGFloat buttonInnerShadowBlurRadius = 5;
        CGColorRef buttonOuterShadow = [UIColor blackColor].CGColor;
        CGSize buttonOuterShadowOffset = CGSizeMake(0, 2);
        CGFloat buttonOuterShadowBlurRadius = 5;
        
        
        //// outerOval Drawing
        UIBezierPath* outerOvalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 19, 19)];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, buttonOuterShadowOffset, buttonOuterShadowBlurRadius, buttonOuterShadow);
        CGContextSetFillColorWithColor(context, buttonOuterShadow);
        [outerOvalPath fill];
        [outerOvalPath addClip];
        CGContextDrawLinearGradient(context, ringGradient, CGPointMake(9.5, -0), CGPointMake(9.5, 19), 0);
        CGContextRestoreGState(context);
        
        
        
        //// overlayOval Drawing
        UIBezierPath* overlayOvalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 19, 19)];
        CGContextSaveGState(context);
        [overlayOvalPath addClip];
        CGContextDrawRadialGradient(context, overlayGradient,
                                    CGPointMake(9.5, -14.77), 17.75,
                                    CGPointMake(9.5, 9.5), 44.61,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        
        
        //// innerOval Drawing
        UIBezierPath* innerOvalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(2, 2, 15, 15)];
        CGContextSaveGState(context);
        [innerOvalPath addClip];
        CGContextDrawLinearGradient(context, ringInnerGradient, CGPointMake(9.5, 2), CGPointMake(9.5, 17), 0);
        CGContextRestoreGState(context);
        
        
        
        //// buttonOval Drawing
        UIBezierPath* buttonOvalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(4, 3, 12, 12)];
        CGContextSaveGState(context);
        [buttonOvalPath addClip];
        CGContextDrawRadialGradient(context, buttonGradient,
                                    CGPointMake(10, 36.23), 2.44,
                                    CGPointMake(10, 17.48), 23.14,
                                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        
        ////// buttonOval Inner Shadow
        CGRect buttonOvalBorderRect = CGRectInset([buttonOvalPath bounds], -buttonInnerShadowBlurRadius, -buttonInnerShadowBlurRadius);
        buttonOvalBorderRect = CGRectOffset(buttonOvalBorderRect, -buttonInnerShadowOffset.width, -buttonInnerShadowOffset.height);
        buttonOvalBorderRect = CGRectInset(CGRectUnion(buttonOvalBorderRect, [buttonOvalPath bounds]), -1, -1);
        
        UIBezierPath* buttonOvalNegativePath = [UIBezierPath bezierPathWithRect: buttonOvalBorderRect];
        [buttonOvalNegativePath appendPath: buttonOvalPath];
        buttonOvalNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = buttonInnerShadowOffset.width + round(buttonOvalBorderRect.size.width);
            CGFloat yOffset = buttonInnerShadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                        buttonInnerShadowBlurRadius,
                                        buttonInnerShadow);
            
            [buttonOvalPath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(buttonOvalBorderRect.size.width), 0);
            [buttonOvalNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [buttonOvalNegativePath fill];
        }
        CGContextRestoreGState(context);
        
        
        
        //// Cleanup
        CGGradientRelease(ringGradient);
        CGGradientRelease(ringInnerGradient);
        CGGradientRelease(buttonGradient);
        CGGradientRelease(overlayGradient);
        CGColorSpaceRelease(colorSpace);
    }
}

@end
