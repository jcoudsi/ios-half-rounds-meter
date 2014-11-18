//
//  HalfRoundsMeterView.h
//
//  Created by Julien Coudsi on 08/11/2014.
//

#import <UIKit/UIKit.h>

@interface HalfRoundsMeterView : UIView

/**
 * @brief The maximum value of the meter.
 **/
@property CGFloat maximumValue;

/**
 * @brief The current value.
 **/
@property CGFloat currentValue;

/**
 * @brief The color for the maximum value.
 **/
@property (nonatomic, strong) UIColor *maximumValueColor;

/**
 * @brief The color for the current value.
 **/
@property (nonatomic, strong) UIColor *currentValueColor;

@end
