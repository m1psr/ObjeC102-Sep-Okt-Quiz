//
//  PSRQuizData.h
//  Quiz
//
//  Created by M on 02.10.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

@import UIKit;

@class PSRQuiz;

@interface PSRQuizData : NSObject

+ (PSRQuizData *)sharedInstance;

- (NSUInteger)quizesCount;

- (NSString *)quizTitleAtIndex:(NSInteger)index;
- (NSString *)quizAnnounceAtIndex:(NSInteger)index;
//- (UIImage *)quizImageAtIndex:(NSInteger)index;
- (PSRQuiz *)quizDataAtIndex:(NSInteger)index;

@end
