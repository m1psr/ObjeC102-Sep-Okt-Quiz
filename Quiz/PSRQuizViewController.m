//
//  ViewController.m
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRQuizViewController.h"
#import "PSRQuize.h"
#import "PSRAnswer.h"
#import "PSRQuestion.h"
#import "QuizeCell.h"

@interface PSRQuizViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *questionImage;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITableView *answersList;

@end

@implementation PSRQuizViewController

- (PSRQuestion *)currentQuestion
{
    return [self.aQuize questionAtIndex:self.currentIndex];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PSRQuizViewController *controller = segue.destinationViewController;
    if ([controller isKindOfClass:[PSRQuizViewController class]]){
        controller.aQuize = self.aQuize;
        controller.currentIndex = self.currentIndex + 1;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    
}

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
    self.questionImage.image = [self currentQuestion].image;
    self.questionLabel.text =[self currentQuestion].text;
    self.answersList.delegate = self;
    self.answersList.dataSource = self;
    [self.answersList reloadData];
}

- (IBAction)answerPressed:(UIButton *)sender
{
//    djklsgdfjkbdlkdfskljoloildghio rtdio 
}

#pragma mark - TableView DataSourse -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self currentQuestion] answers].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuizeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"1"];
    
    [self configureCell:cell
             withAnswer:[[self currentQuestion] answers][indexPath.row]];
    
    return cell;
}

- (void)configureCell:(QuizeCell  *)cell withAnswer:(PSRAnswer *)answer
{
    cell.topText.text = answer.text;
    cell.bottomText.text = [[self.answersList indexPathForCell:cell] description];
}

@end
