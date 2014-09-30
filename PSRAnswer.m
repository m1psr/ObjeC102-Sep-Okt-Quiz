//
//  PSRAnswer.m
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRAnswer.h"

//@interface PSRAnswer ()
//
//@property (nonatomic, copy, readwrite) NSString *text;
//
//@end

@implementation PSRAnswer

+ (instancetype)answerWithText:(NSString *)text isCorrect:(BOOL)correct {
    return [[self alloc] initWithText:text isCorrect:correct];
}

- (instancetype)initWithText:(NSString *)text isCorrect:(BOOL)correct
{
    self = [super init];
    if (self) {
        _text = [text copy];
        _correct = correct;
    }
    return self;
}

- (instancetype)init
{
    NSAssert(NO, @"Use anserWithText:isCorrct:");
    return nil;
}

@end
