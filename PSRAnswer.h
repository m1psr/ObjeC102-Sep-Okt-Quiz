//
//  PSRAnswer.h
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSRAnswer : NSObject

//strong
//weak
//copy
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic) BOOL correct;

+ (instancetype)answerWithText:(NSString *)text isCorect:(BOOL)correct;

- (instancetype)initWithText:(NSString *)text isCorrect:(BOOL)correct;

@end
