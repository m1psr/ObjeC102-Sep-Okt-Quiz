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

+ (instancetype)cinemaQuize
{
    NSArray *quizData = @[@{@"questionText" : @"Кто это?",
                            @"image" : [UIImage imageNamed:@"firstsQuestion"],
                            @"answers" : @[@{@"answerText": @"Скарлетт Йохансон",
                                             @"isCorrect": @YES,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"Анджелина Джоли",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"Дженнифер Энистон",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"Натали Портман",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]}]},
                          
                          @{@"questionText" : @"Фильм снят по основам диснеевского мультфильма «Спящая красавица». В каком году состоялась премьера этого мультфильма?",
                            @"image" : [UIImage imageNamed:@"secondQuestion"],
                            @"answers" : @[@{@"answerText": @"1959",
                                             @"isCorrect": @YES,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"1956",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"1951",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"1961",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]}]},
                          
                          @{@"questionText" : @"Произведения какого композитора были взяты за основу музыкального сопровождения «Спящей красавицы»?",
                            @"image" : [NSNull null],
                            @"answers" : @[@{@"answerText": @"М.И. Глинка",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"Ц.А. Кюи",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"П.И. Чайковский",
                                             @"isCorrect": @YES,
                                             @"answerImage": [UIImage imageNamed:@"question3"]},
                                           
                                           @{@"answerText": @"Н.А. Римский-Корсаков",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]}]},
                          
                          @{@"questionText" : @"Какое проклятие наложила на принцессу Малефисента?",
                            @"image" : [UIImage imageNamed:@"melafinesta.jpg"],
                            @"answers" : @[@{@"answerText": @"Аврора должна будет уколоть свой палец о шипы розы и умереть",
                                             @"isCorrect": @NO,
                                             @"image": [NSNull null]},
                                           
                                           @{@"answerText": @"Аврора должна будет уколоть свой палец о веретено и уснуть на 100 лет",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"Аврора должна будет откусить отравленное яблоко и умереть",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"Аврора должна будет уколоть свой палец о веретено и умереть",
                                             @"isCorrect": @YES,
                                             @"answerImage": [NSNull null]}]},
                          
                          
                          @{@"questionText" : @"Кому принадлежит фраза \"Hasta la vista, baby\"?",
                            @"image" : [NSNull null],
                            @"answers" : @[@{@"answerText": @"Стивен Сигал",
                                             @"isCorrect": @NO,
                                             @"answerImage": [UIImage imageNamed:@"fourthQuestion4"]},
                                           
                                           @{@"answerText": @"Арнольд Шварцнеггер",
                                             @"isCorrect": @YES,
                                             @"answerImage": [UIImage imageNamed:@"fourthQuestion3"]},
                                           
                                           @{@"answerText": @"Сильвестр Сталоне",
                                             @"isCorrect": @NO,
                                             @"answerImage": [UIImage imageNamed:@"fourthQuestion2"]},
                                           
                                           @{@"answerText": @"Аркадий Укупник",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]}]}];
    
    NSMutableArray *questions = [NSMutableArray arrayWithCapacity:quizData.count];
    for (NSDictionary *questionData in quizData) {
        
        NSMutableArray *answers = [NSMutableArray arrayWithCapacity:[questionData[@"answers"] count]];
        for (NSDictionary *answerData in questionData[@"answers"]) {
            
            PSRAnswer *answer;
            if (answerData[@"answerImage"] == [NSNull null]) {
                answer = [PSRAnswer answerWithText:answerData[@"answerText"] isCorrect:answerData[@"isCorrect"]];
            } else {
                answer = MakePSRAnswer(answerData[@"answerText"], answerData[@"isCorrect"], answerData[@"answerImage"]);
            }
            [answers addObject:answer];
        }
        
        UIImage *questionImage = questionData[@"image"] == [NSNull null] ? nil : questionData[@"image"];
        PSRQuestion *question = [PSRQuestion questionWithText:questionData[@"questionText"] image:questionImage answers:answers];
        [questions addObject:question];
    }
    
    return [self quizeWithQuestions:questions];
}

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
