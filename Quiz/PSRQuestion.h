//
//  PSRQuestion.h
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

@import UIKit;

@interface PSRQuestion : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSArray *answers;

+ (instancetype)questionWithText:(NSString *)text image:(UIImage *)image answers:(NSArray *)answers;

@end
