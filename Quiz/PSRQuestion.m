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
    self = [super init];
    if (self) {
        _text = [text copy];
        _answers = [answers copy];
        _image = image;
        _selectedIndex = -1;
    }
    return self;
}

- (instancetype)init
{
    NSAssert(NO, @"Use questionWithText:isCorrct:");
    return nil;
}

@end
