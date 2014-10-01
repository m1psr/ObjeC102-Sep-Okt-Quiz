//
//  ViewController.m
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRQuizViewController.h"
#import "PSRQuizCell.h"

#import "PSRQuize.h"
#import "PSRAnswer.h"
#import "PSRQuestion.h"

@interface PSRQuizViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *questionImage;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITableView *answersList;

@end

@implementation PSRQuizViewController


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PSRQuizViewController *controller = segue.destinationViewController;
    if ([controller isKindOfClass:[PSRQuizViewController class]]){
        
        NSUInteger selectedIndex = [self answerLabelToSelectedIndex:[(PSRQuizCell *)sender letterLabel].text];
        [[self currentQuestion] setSelectedIndex:selectedIndex]; // сохраним ответ пользователя
        
        controller.aQuize = self.aQuize;
        controller.questionIndex = self.questionIndex + 1;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    
}

#pragma mark - Private Methods

- (void)setup
{
    [self setupModel];
    [self setupViews];
}


- (void)setupModel
{
    if (!self.aQuize){
        self.aQuize = [PSRQuize cinemaQuize];
    }
}

- (void)setupViews
{
    PSRQuestion *currentQuestion = [self currentQuestion];
    self.questionImage.image = currentQuestion.image ? currentQuestion.image : [UIImage imageNamed:@"questionMarks"];
    self.questionLabel.text = currentQuestion.text;
    
    self.answersList.delegate = self;
    self.answersList.dataSource = self;
//    [self.answersList reloadData];
}

- (PSRQuestion *)currentQuestion
{
    return [self.aQuize questionAtIndex:self.questionIndex];
}

- (NSString *)answerIndexToLabel:(NSInteger)index
{
    return [NSString stringWithFormat:@"%c", 'A' + (char)index];
}

- (NSUInteger)answerLabelToSelectedIndex:(NSString *)answerLabel
{
    return (NSUInteger)[answerLabel characterAtIndex:0] - 'A';
}

#pragma mark - TableView DataSourse -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self currentQuestion] answers].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PSRQuizCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PSRQuizCellRIdentifier"];
    
    [self configureCell:cell withAnswer:[[self currentQuestion] answers][indexPath.row] answerIndex:indexPath.row];
    
    return cell;
}

- (void)configureCell:(PSRQuizCell *)cell withAnswer:(PSRAnswer *)answer answerIndex:(NSInteger)index
{
    cell.answerText.text = answer.text;
    cell.answerImage.image = answer.image;
    cell.letterLabel.text = [self answerIndexToLabel:index];
}

@end
