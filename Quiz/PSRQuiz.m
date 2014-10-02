//
//  PSRQuize.m
//  Quiz
//
//  Created by n.shubenkov on 26/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

@import UIKit;

#import "PSRQuiz.h"
#import "PSRQuestion.h"
#import "PSRAnswer.h"

@interface PSRQuiz()

@property (nonatomic, strong) NSArray *questions;

@end

@implementation PSRQuiz

+ (instancetype)quizeWithQuestions:(NSArray *)questions
{
    PSRQuiz *psrQuzie = [[self alloc] init];
    psrQuzie.questions = [questions copy];
    return psrQuzie;
}

- (NSInteger)quiestionsCount
{
    return self.questions.count;
}

- (PSRQuestion *)questionAtIndex:(NSInteger)index
{
    if (self.questions.count <= index){
        return nil;
    }
    return self.questions[index];
}

@end
