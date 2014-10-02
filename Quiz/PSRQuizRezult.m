//
//  PSRQuizRezult.m
//  Quiz
//
//  Created by M on 02.10.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRQuizRezult.h"

#import "PSRQuiz.h"
#import "PSRQuestion.h"
#import "PSRAnswer.h"

@interface PSRQuizRezult ()

@property (weak, nonatomic) IBOutlet UILabel *answersRight;
@property (weak, nonatomic) IBOutlet UILabel *answersTotal;
@property (weak, nonatomic) IBOutlet UIImageView *resultImage;

@end

@implementation PSRQuizRezult
{
    NSUInteger _quizAnswersRight;
    NSUInteger _quizAnswersTotal;
}

 - (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.quiz) {
        return;
    }
    
    [self setup];
    [self setupViews];
}

#pragma mark - Private Methods

- (void)setup
{
    _quizAnswersTotal = [self.quiz quiestionsCount];
    for (NSUInteger i = 0; i < _quizAnswersTotal; i++) {
        PSRQuestion *question = [self.quiz questionAtIndex:i];
        [question.answers enumerateObjectsUsingBlock:^(PSRAnswer *answer, NSUInteger idx, BOOL *stop) {
            if (idx == question.selectedIndex) {
                if (answer.correct) {
                    _quizAnswersRight++;
                }
                *stop = YES;
            }
        }];
    }
}

- (void)setupViews
{
    self.answersRight.text = [NSString stringWithFormat:@"%ld", _quizAnswersRight];
    self.answersTotal.text = [NSString stringWithFormat:@"%ld", _quizAnswersTotal];
    
    NSUInteger percentOfRights = (NSUInteger)(_quizAnswersRight * 100 / _quizAnswersTotal);
    if (percentOfRights == 100) {
        self.resultImage.image = [UIImage imageNamed:@"Excellent"];
    } else if (percentOfRights > 40) {
        self.resultImage.image = [UIImage imageNamed:@"normal"];
    } else {
        self.resultImage.image = [UIImage imageNamed:@"bad"];
    }
}

#pragma mark - PSRQuizHandler Methods

- (void)handleQuize:(PSRQuiz *)quiz withQuestionIndex:(NSUInteger)index
{
    self.quiz = quiz;
}

@end
