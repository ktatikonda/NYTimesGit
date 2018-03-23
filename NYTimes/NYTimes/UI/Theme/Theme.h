//
//  Theme.h
//  NYTimes
//
//  Created by Kranthi Tatikonda on 22/03/18.
//  Copyright © 2018 Kranthi Tatikonda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Theme : NSObject

+ (NSString *)date_monthDayYear:(NSDate *)date;

@end


@interface UIFont (Helpers)

+ (UIFont *)primaryFont;
+ (UIFont *)georgiaFontOfSize:(CGFloat)size;

@end

@interface UIColor (Helpers)

+ (UIColor *)primaryGrayColor;
+ (UIColor *)primaryLightGrayColor;
+ (UIColor *)primaryDarkGrayColor;

@end

