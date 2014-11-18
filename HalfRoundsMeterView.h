//
//  HalfRoundsMeterView.h
//
//  Created by Julien Coudsi on 08/11/2014.
//

#import <UIKit/UIKit.h>

@interface HalfRoundsMeterView : UIView

/**
 * @brief The maximum value of the meter (mandatory).
 **/
@property CGFloat maximumValue;

/**
 * @brief The current value (default : 0).
 **/
@property CGFloat currentValue;

/**
 * @brief The color for the maximum value (default : grey).
 **/
@property (nonatomic, strong) UIColor *maximumValueColor;

/**
 * @brief The color for the current value (default : red).
 **/
@property (nonatomic, strong) UIColor *currentValueColor;


@end
