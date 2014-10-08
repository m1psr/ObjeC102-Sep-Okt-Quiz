//
//  NSMutableArray+PSRShuffling.h
//  Quiz
//
//  Created by M on 01.10.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

// http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray

#import <Foundation/Foundation.h>

@interface NSMutableArray (PSRShuffling)

- (void)psr_shuffle;

@end
