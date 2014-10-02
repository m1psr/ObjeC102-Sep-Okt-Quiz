//
//  PSRQuizData.m
//  Quiz
//
//  Created by M on 02.10.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRQuizData.h"

#import "PSRAnswer.h"
#import "PSRQuestion.h"
#import "PSRQuiz.h"

#import "NSMutableArray+PSRShuffling.h"

@interface PSRQuizData ()

@property (nonatomic, strong) NSArray *quizes;

@end

@implementation PSRQuizData

// https://ru.wikipedia.org/wiki/%D0%9E%D0%B4%D0%B8%D0%BD%D0%BE%D1%87%D0%BA%D0%B0_%28%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%29#.D0.9F.D1.80.D0.B8.D0.BC.D0.B5.D1.80_.D0.BD.D0.B0_Objective-C

+ (PSRQuizData *)sharedInstance
{
    static dispatch_once_t pred;
    static PSRQuizData *sharedInstance = nil;
    
    dispatch_once(&pred, ^{ sharedInstance = [[self alloc] init]; });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _quizes = [NSArray array];
        [self loadData];
    }
    
    return self;
}

- (NSUInteger)quizesCount
{
    return [self.quizes count];
}

- (NSString *)quizTitleAtIndex:(NSInteger)index
{
    return self.quizes[index][@"quizName"];
}

- (UIImage *)quizImageAtIndex:(NSInteger)index
{
    return self.quizes[index][@"quizImage"];
}

- (PSRQuiz *)quizDataAtIndex:(NSInteger)index
{
    if (index >= [self.quizes count]) {
        return nil;
    }
    
    NSArray *quizData = self.quizes[index][@"quizData"];
    
    NSMutableArray *questions = [NSMutableArray arrayWithCapacity:quizData.count];
    for (NSDictionary *questionData in quizData) {
        
        NSMutableArray *answers = [NSMutableArray arrayWithCapacity:[questionData[@"answers"] count]];
        for (NSDictionary *answerData in questionData[@"answers"]) {
            
            PSRAnswer *answer;
            if (answerData[@"answerImage"] == [NSNull null]) {
                answer = [PSRAnswer answerWithText:answerData[@"answerText"] isCorrect:[answerData[@"isCorrect"] boolValue]];
            } else {
                answer = MakePSRAnswer(answerData[@"answerText"], [answerData[@"isCorrect"] boolValue], answerData[@"answerImage"]);
            }
            [answers addObject:answer];
        }
        [answers shuffle];
        
        UIImage *questionImage = questionData[@"image"] == [NSNull null] ? nil : questionData[@"image"];
        PSRQuestion *question = [PSRQuestion questionWithText:questionData[@"questionText"] image:questionImage answers:answers];
        [questions addObject:question];
    }
    
    return [PSRQuiz quizeWithQuestions:questions];
}

#pragma mark - Private Methods

- (void)loadData
{
    // quiz 1
    
    NSDictionary *quizCinema = @{@"quizName" : @"Cinema Quiz",
                                 @"quizImage" : [NSNull null],
                                 @"quizData" : [self cinemaQuiz]};
    
    // quiz 2
    
    NSDictionary *quizAnimal = @{@"quizName" : @"Animals Quiz",
                                 @"quizImage" : [NSNull null],
                                 @"quizData" : [self animalQuiz]};
    
    self.quizes = @[quizCinema, quizAnimal];
}

- (NSArray *)cinemaQuiz
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
    
    return quizData;
}

- (NSArray *)animalQuiz
{
    NSArray *quizData = @[@{@"questionText" : @"Почему крокодилы, поедая мясо, «плачут»?",
                            @"image" : [UIImage imageNamed:@"animal1.jpg"],
                            @"answers" : @[@{@"answerText": @"Испытывают вину",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"От радости - наконец-то есть,что покушать",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @" Выводят соли из организма",
                                             @"isCorrect": @YES,
                                             @"answerImage": [NSNull null]}]},
                          
                          @{@"questionText" : @"Размер самого крупного паука на Земле превышает...?",
                            @"image" : [UIImage imageNamed:@"animal2.jpg"],
                            @"answers" : @[@{@"answerText": @"1 метр",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"28 см",
                                             @"isCorrect": @YES,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"50 см",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"95.5 см",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"1.5 метра",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]}]},
                          
                          @{@"questionText" : @"Какое животное имеет годовые кольца как у деревьев?",
                            @"image" : [UIImage imageNamed:@"animal3.jpg"],
                            @"answers" : @[@{@"answerText": @"Черепаха",
                                             @"isCorrect": @YES,
                                             @"answerImage": [UIImage imageNamed:@"tort"]},
                                           
                                           @{@"answerText": @"Хамелеон",
                                             @"isCorrect": @NO,
                                             @"answerImage": [UIImage imageNamed:@"ham"]},
                                           
                                           @{@"answerText": @"Кольчатая змея",
                                             @"isCorrect": @NO,
                                             @"answerImage": [UIImage imageNamed:@"snak"]}]},
                          
                          @{@"questionText" : @"Зачем совы селят в своих гнёздах змей?",
                            @"image" : [UIImage imageNamed:@"animal4.jpg"],
                            @"answers" : @[@{@"answerText": @"Чтобы отгоняли хищников",
                                             @"isCorrect": @NO,
                                             @"image": [NSNull null]},
                                           
                                           @{@"answerText": @"Чтобы проводили естественный отбор и съедали слабых",
                                             @"isCorrect": @NO,
                                             @"answerImage": [NSNull null]},
                                           
                                           @{@"answerText": @"Чтобы птенцы быстрее росли и меньше болели",
                                             @"isCorrect": @YES,
                                             @"answerImage": [NSNull null]}]},
                          
                          
                          @{@"questionText" : @"Какого цвета кожа у Белого медведя?",
                            @"image" : [UIImage imageNamed:@"bear"],
                            @"answers" : @[@{@"answerText": @"Белая",
                                             @"isCorrect": @NO,
                                             @"answerImage": [UIImage imageNamed:@"animalPlaceholder.jpg"]},
                                           
                                           @{@"answerText": @"Зеленая",
                                             @"isCorrect": @NO,
                                             @"answerImage": [UIImage imageNamed:@"animal5.jpg"]},
                                           
                                           @{@"answerText": @"Черная",
                                             @"isCorrect": @YES,
                                             @"answerImage": [UIImage imageNamed:@"animalPlaceholder.jpg"]},
                                           
                                           @{@"answerText": @"Коричневая",
                                             @"isCorrect": @NO,
                                             @"answerImage": [UIImage imageNamed:@"animalPlaceholder.jpg"]}]}];
    return quizData;
}

@end
