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
@property (weak, nonatomic) IBOutlet UILabel *resultComment;

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
        self.resultComment.text = @"Ничо так!";
    } else if (percentOfRights > 40) {
        self.resultImage.image = [UIImage imageNamed:@"normal"];
        self.resultComment.text = @"Норм!";
    } else {
        self.resultImage.image = [UIImage imageNamed:@"bad"];
        self.resultComment.text = @"Позор!";
    }
}

#pragma mark - IBActions

- (IBAction)gotoQuizList:(id)sender {
    // http://stackoverflow.com/questions/19841663/storyboard-navigate-to-root-view-controller
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - PSRQuizHandler Methods

- (void)handleQuize:(PSRQuiz *)quiz withQuestionIndex:(NSUInteger)index
{
    self.quiz = quiz;
}

@end
