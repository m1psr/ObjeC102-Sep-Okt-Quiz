//
//  PSRQuestion.h
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
@import UIKit;

@interface PSRQuestion : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSArray *answers;

+ (instancetype)questionWithText:(NSString *)text image:(UIImage *)image answers:(NSArray *)answers;

//- (instancetype)initWithText:(NSString *)text image:(UIImage *)image answers:(NSArray *)answers;

@end
