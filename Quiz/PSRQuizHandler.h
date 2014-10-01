//
//  PSRQuizHandler.h
//  Quiz
//
//  Created by M on 01.10.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

@import Foundation;

@class PSRQuiz;

@protocol PSRQuizHandler <NSObject>

- (void)handleQuize:(PSRQuiz *)quiz withQuestionIndex:(NSUInteger)index;

@end
