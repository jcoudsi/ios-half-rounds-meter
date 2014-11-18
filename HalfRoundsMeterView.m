//
//  HalfRoundsMeterView.m
//
//  Created by Julien Coudsi on 08/11/2014.
//
#import "HalfRoundsMeterView.h"

@implementation HalfRoundsMeterView


#pragma mark Initialization

/**
 * @brief Initializes the round meter component with default values .
 *
 **/
- (void) initialize
{
    self.currentValueColor = [UIColor redColor];
    self.maximumValueColor = [UIColor grayColor];
    
    self.currentValue = 0;
    self.maximumValue = 0;
    
    self.backgroundColor = [UIColor whiteColor];
    
    //The component must be redraw when the bounds changes (for example after rotation)
    self.contentMode = UIViewContentModeRedraw;
}

#pragma mark Constructors

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

#pragma mark Drawing

- (CGFloat) getRadiansFromDegrees:(CGFloat) degrees
{
    return ((3.14159265359*degrees)/180);
}


- (void)drawRect:(CGRect)rect
{
    
    //Working only if a maximum value is specified (different from zero)
    if (self.maximumValue != 0.f)
    {
        //Calculates the ratio between the current and the maximum value
        CGFloat ratio = self.currentValue/self.maximumValue;
        
        //If the current value is the biggest, the ratio is inversed (for example 1,1% -> 0,9%)
        //In this case, the current value circle will be the biggest.
        //So, the inversed ratio permits to draw the circles without exceed the view size 
        if (ratio > 1)
        {
            ratio = 1/ratio;
        }
        
        //Gets the view size
        CGFloat viewHeight = self.bounds.size.height;
        CGFloat viewWidth = self.bounds.size.width;
        
        //Gets the radius of the biggest circle.
        CGFloat radiusBiggestCircle = 0.f;
        //Tests in order to the round meter always fits in the view, despite its width and height.
        //If the height is longer than the half of the width, it can't be used as the radius because the
        //diameter will be bigger than the view width.
        if (viewHeight < viewWidth / 2)
        {
            radiusBiggestCircle = viewHeight;
        }
        else
        {
            radiusBiggestCircle = viewWidth/2;
        }
        
        //Gets the radius of the smallest circle, depending ratio and biggest circle radius.
        CGFloat radiusSmallestCircle = 0.f;
        radiusSmallestCircle = (int)(radiusBiggestCircle * ratio);
        
        
        //Creates the biggest circle to draw
        UIBezierPath *BiggestCirclePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(viewWidth/2, viewHeight)
                                                                        radius:radiusBiggestCircle
                                                                    startAngle:0
                                                                      endAngle:[self getRadiansFromDegrees:180]
                                                                     clockwise:NO];
        //Creates the smallest circle to draw
        UIBezierPath *SmallestCirclePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(viewWidth/2, viewHeight)
                                                                         radius:radiusSmallestCircle
                                                                     startAngle:0
                                                                       endAngle:[self getRadiansFromDegrees:180]
                                                                      clockwise:NO];
        
        //If the current value isn't bigger than the maximum value, colors are kept
        if (self.maximumValue >= self.currentValue)
        {
            [self.maximumValueColor setFill];
            [BiggestCirclePath fill];
            
            [self.currentValueColor setFill];
            [SmallestCirclePath fill];
        }
        //If the current value isn bigger than the maximum value, colors are reverse
        else
        {
            [self.currentValueColor setFill];
            [BiggestCirclePath fill];
            
            [self.maximumValueColor setFill];
            [SmallestCirclePath fill];
        }
        
    }
    
}


@end
