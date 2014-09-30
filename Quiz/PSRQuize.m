//
//  PSRQuize.m
//  Quiz
//
//  Created by n.shubenkov on 26/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSRQuize.h"
#import "PSRQuestion.h"
#import "PSRAnswer.h"

@interface PSRQuize()

@property (nonatomic, strong) NSArray *questions;

@end

@implementation PSRQuize

+ (instancetype)quizeWithQuestions:(NSArray *)quiestions
{
    NSParameterAssert(quiestions.count > 0);
    PSRQuize *aQuzie = [PSRQuize new];
    aQuzie.questions = quiestions;
    
    return aQuzie;
}

- (NSInteger)quiestionsCount
{
    return self.questions.count;
}

- (PSRQuestion *)questionAtIndex:(NSInteger)index
{
    NSParameterAssert(self.questions.count > index);
    if (self.questions.count <= index){
        return nil;
    }
    return self.questions[index];
}

+ (PSRQuize *)cinemaQuize
{
    NSMutableArray *questions = [NSMutableArray new];
    NSArray *texts = @[@"Кто это?",
                      @"Фильм снят по основам диснеевского мультфильма «Спящая красавица». В каком году состоялась премьера этого мультфильма?",
                      @"3). Произведения какого композитора были взяты за основу музыкального сопровождения «Спящей красавицы»?"];
    NSArray *globalAnwers = @[@[@"а. Скарлетт Йоханссо",@"б. Анджелина Джоли",@"в. Дженнифер Энистон"],
                        @[@"1959",@"1956",@"145523",@"532523"],
                        @[@"Корсаков",@"Кюти",@"aas"]];
    NSArray *images = @[[UIImage imageNamed:@"firstsQuestion"],
                        [UIImage imageNamed:@"secondQuestion"],
                        [UIImage imageNamed:@"firstsQuestion"]];
    for (int i = 0; i < 3; i++){
        NSMutableArray *localAnswers = [NSMutableArray new];
        for (NSString *anAnswer in globalAnwers[i]){
            [localAnswers addObject:[[PSRAnswer alloc]initWithText:anAnswer
                                                         isCorrect:i == 2]];
        }
        PSRQuestion *question = [[PSRQuestion alloc] initWithText:texts[i]
                                                            image:images[i]
                                                          answers:localAnswers];
        [questions addObject:question];
    }
    PSRQuize *queze = [PSRQuize quizeWithQuestions:questions];
    return queze;
}

@end
