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

- (NSString *)quizTitleAtIndex:(NSUInteger)index;
- (NSString *)quizAnnounceAtIndex:(NSUInteger)index;
- (PSRQuiz *)quizDataAtIndex:(NSUInteger)index;

@end
