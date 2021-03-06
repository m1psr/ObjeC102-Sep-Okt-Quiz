//
//  PSRQuize.h
//  Quiz
//
//  Created by n.shubenkov on 26/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

@import Foundation;

@class PSRQuestion;

@interface PSRQuiz : NSObject

@property (nonatomic, strong) UIImage *image;

+ (instancetype)quizeWithQuestions:(NSArray *)quiestions;

- (NSInteger)quiestionsCount;
- (PSRQuestion *)questionAtIndex:(NSInteger)index;

@end
