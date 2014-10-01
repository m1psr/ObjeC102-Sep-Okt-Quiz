//
//  ViewController.h
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

@import UIKit;

@class PSRQuize;

@interface PSRQuizViewController : UIViewController

@property (nonatomic, strong) PSRQuize *aQuize;
@property (nonatomic) NSUInteger questionIndex;

@end
