//
//  NSArray+FunctionalHelpers.m
//  NYTimes
//
//  Created by Kranthi Tatikonda on 22/03/18.
//  Copyright © 2018 Kranthi Tatikonda. All rights reserved.
//

#import "NSArray+FunctionalHelpers.h"

@implementation NSArray (FunctionalHelpers)

- (NSMutableArray*)mapWithBlock:(id (^)(id))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        id mapped = block(obj);

        if (mapped) {
            [result addObject:mapped];
        }
    }
    return result;
}
@end
