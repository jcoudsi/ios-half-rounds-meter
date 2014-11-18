iOS Half Rounds Meter
=====================

A meter wich displays information with two half rounds

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

#### UIColor *backgroundColor (default : white)

To change the background color of the component view.

Usage example
=============

```objective-c
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
