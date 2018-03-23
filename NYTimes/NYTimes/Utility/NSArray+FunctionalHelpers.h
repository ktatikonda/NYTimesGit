//
//  NSArray+FunctionalHelpers.h
//  NYTimes
//
//  Created by Kranthi Tatikonda on 22/03/18.
//  Copyright © 2018 Kranthi Tatikonda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FunctionalHelpers)
- (NSMutableArray*)mapWithBlock:(id (^)(id))block;

@end
