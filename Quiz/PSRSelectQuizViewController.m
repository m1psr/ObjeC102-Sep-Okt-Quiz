//
//  PSRSelectQuizViewController.m
//  Quiz
//
//  Created by M on 02.10.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRSelectQuizViewController.h"
#import "PSRQuizData.h"
#import "PSRQuizHandler.h"

@implementation PSRSelectQuizViewController
{
    PSRQuizData *_quizData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _quizData = [PSRQuizData sharedInstance];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController conformsToProtocol:@protocol(PSRQuizHandler)]) {
        UIViewController<PSRQuizHandler> *quizViewController = segue.destinationViewController;
        [quizViewController handleQuize:[_quizData quizDataAtIndex:[[self.tableView indexPathForSelectedRow] row]] withQuestionIndex:0];
    }
}

#pragma mark - UITableViewController Delegates Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_quizData quizesCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PSRSelectQuizCellRIdentifier"];
    
    cell.textLabel.text = [_quizData quizTitleAtIndex:indexPath.row];
    cell.detailTextLabel.text = [_quizData quizAnnounceAtIndex:indexPath.row];
    
    return cell;
}

@end
