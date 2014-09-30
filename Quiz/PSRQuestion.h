//
//  PSRQuestion.h
//  Quiz
//
//  Created by n.shubenkov on 23/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PSRQuestion : NSObject
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSArray *answers;
@property (nonatomic, strong) UIImage *image;
- (instancetype)initWithText:(NSString *)text image:(UIImage *)image answers:(NSArray *)answers;

@end
