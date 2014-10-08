//
//  NSMutableArray+PSRShuffling.m
//  Quiz
//
//  Created by M on 01.10.14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "NSMutableArray+PSRShuffling.h"

@implementation NSMutableArray (PSRShuffling)

- (void)psr_shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((UInt32)remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end
