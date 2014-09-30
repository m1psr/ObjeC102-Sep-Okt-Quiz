//
//  PSRQuestion.m
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRQuestion.h"

@implementation PSRQuestion

+ (instancetype)questionWithText:(NSString *)text image:(UIImage *)image answers:(NSArray *)answers
{
    return [[self alloc] initWithText:text image:image answers:answers];
}

- (instancetype)initWithText:(NSString *)text image:(UIImage *)image answers:(NSArray *)answers
{
//    NSParameterAssert(text.length > 0);
//    NSAssert(answers.count > 0, @"it is stupid to create queestion without answers %@", @"privet");
    
    self = [super init];
    if (self) {
        _text = [text copy];
        _answers = [answers copy];
        _image = image;
    }
    return self;
}

- (instancetype)init
{
    NSAssert(NO, @"Use anserWithText:isCorrct:");
    return nil;
}

@end
