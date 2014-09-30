//
//  PSRAnswer.h
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

//@import Foundation;
@import UIKit;

@interface PSRAnswer : NSObject

@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic) BOOL correct;
//@property (nonatomic, strong) UIImage *image;

+ (instancetype)answerWithText:(NSString *)text isCorrect:(BOOL)correct;

//- (instancetype)initWithText:(NSString *)text isCorrect:(BOOL)correct;

@end
