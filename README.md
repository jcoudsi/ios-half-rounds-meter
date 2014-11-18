iOS Half Rounds Meter 1.0
=========================

A custom meter view wich displays information with two half rounds.
HalfRoundsMeterView inherits from UIView and exposes all its properties and method.

Installation
============

Coming soon

Options
=======

#### CGFloat currentValue (default : 0)

Specifies the current value of the meter.

#### CGFloat maximumValue (mandatory)

Specifies the maximum value of the meter

#### UIColor *maximumValueColor (default : gray)

To change the color of the round which represents the maximum value.

#### UIColor *currentValueColor (default : red)

To change the color of the round which represents the current value.

Usage example
=============

```objective-c

#import "HalfRoundsMeterView.h"

//Some code

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Creates the view
    HalfRoundsMeterView *circleView = [[HalfRoundsMeterView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    
    //Set the current and maximum values
    circleView.currentValue = 100;
    circleView.maximumValue = 200;
    
    //Customizes the colors
    circleView.currentValueColor = [UIColor colorWithRed:0.039 green:0.729 blue:0.71 alpha:1];
    circleView.maximumValueColor = [UIColor blueColor];
    
    //Add to the content view
    [self.view addSubview:circleView];
}
```
