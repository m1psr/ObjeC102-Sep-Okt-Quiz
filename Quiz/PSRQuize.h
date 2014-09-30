//
//  PSRQuize.h
//  Quiz
//
//  Created by n.shubenkov on 26/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PSRQuestion;

@interface PSRQuize : NSObject

@property (nonatomic, strong) UIImage *image;
+ (instancetype)quizeWithQuestions:(NSArray *)quiestions;
- (PSRQuestion *)questionAtIndex:(NSInteger)index;
- (NSInteger)quiestionsCount;

+ (PSRQuize *)cinemaQuize;

@end
