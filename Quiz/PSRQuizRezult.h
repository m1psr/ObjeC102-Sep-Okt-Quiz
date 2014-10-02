//
//  PSRQuizRezult.h
//  Quiz
//
//  Created by M on 02.10.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

@import UIKit;

#import "PSRQuizHandler.h"

@class PSRQuiz;

@interface PSRQuizRezult : UIViewController <PSRQuizHandler>

@property (nonatomic, strong) PSRQuiz* quiz;

@end
