//
//  PSRAnswer.m
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRAnswer.h"

@implementation PSRAnswer

+ (instancetype)answerWithText:(NSString *)text isCorrect:(BOOL)correct image:(UIImage *)image
{
    return [[self alloc] initWithText:text isCorrect:correct image:image];
}

+ (instancetype)answerWithText:(NSString *)text isCorrect:(BOOL)correct
{
    return [[self alloc] initWithText:text isCorrect:correct image:nil];
}

- (instancetype)initWithText:(NSString *)text isCorrect:(BOOL)correct image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _text = [text copy];
        _correct = correct;
        _image = image;
    }
    return self;
}

- (instancetype)init
{
    NSAssert(NO, @"Use anserWithText:isCorret:");
    return nil;
}

@end
