//
//  PSRAnimationController.m
//  Quiz
//
//  Created by n.shubenkov on 26/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRAnimationController.h"

@interface PSRAnimationController ()

@end

@implementation PSRAnimationController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(someNotification:)
                                                 name:nil
                                               object:nil];
    
    // Do any additional setup after loading the view.
}

- (void)someNotification:(NSNotification *)notification
{
    NSLog(@"recived notification %@",notification);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self animate];
    [self animateWithUorBlocks];
}

- (void)animateWithUorBlocks
{
    [self animateView:self.secondView
          withOptions:UIViewAnimationOptionCurveLinear
             withCompletion:^(NSString *str) {
                 NSLog(@"%@",str);
                 [self animateView:self.secondView
                       withOptions:UIViewAnimationOptionCurveEaseIn
                    withCompletion:nil];
             }];
    [self animateView:self.thirdView
          withOptions:UIViewAnimationOptionCurveEaseOut
       withCompletion:nil];
}

- (void)animateView:(UIView *)aView withOptions:(UIViewAnimationOptions)options withCompletion:(void (^)(NSString *str))completionBlock
{
    [UIView animateWithDuration:0.7
                          delay:0.1
                        options:options
                     animations:^{
                         CGRect frame = aView.frame;
                         frame.size.width *= 2;
                         aView.frame = frame;
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5
                                               delay:0
                                             options:options
                                          animations:^{
                                              CGRect frame = aView.frame;
                                              frame.size.width /= 2;
                                              aView.frame = frame;

                                          } completion:^(BOOL finished) {
                                              if (completionBlock){
                                                  completionBlock(@"block completed");
                                              }
                                          }];
                     }];
}

- (void)animate
{
    CGRect savedFrame = self.firstView.frame;
    
    
    [UIView animateWithDuration:2.5
                     animations:^{
                         NSLog(@"animation did start");
                         self.view.backgroundColor = [UIColor yellowColor];
                         self.firstView.alpha      = 0.5;
                     } completion:^(BOOL finished) {
                         NSLog(@"animation did complete");
                         
                         [UIView animateWithDuration:1.5 animations:^{
                             CGRect frame = self.firstView.frame;
                             frame.origin.x += 100;
                             frame.origin.y -= 100;
                             self.firstView.frame = frame;
                             self.firstView.alpha = 1;
                         } completion:^(BOOL finished) {
                             
                             [UIView animateWithDuration:0.9 animations:^{
                                  self.firstView.frame = savedFrame;
                             } completion:^(BOOL finished) {
                                 [self animate];
                             }];
                         }];
                     }];
    NSLog(@"exit form %s",__PRETTY_FUNCTION__);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
