//
//  UIColor+JTBColor.h
//  JTB
//
//  Created by 陈良峰 on 2018/1/9.
//  Copyright © 2018年 JTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JTBColor)

//十六进制字符串转UIColor
+(UIColor *)hexStringToColor:(NSString *)stringToConvert;
+(UIColor *)hexStringToColor:(NSString *)stringToConvert alpha:(CGFloat)alpha;

@end
