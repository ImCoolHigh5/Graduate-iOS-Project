//
//  SessionDataController.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Session;

@interface SessionDataController : NSObject

#pragma mark - Public Methods

-(Session*)makeSessionFromNSDictionary:(NSDictionary*)sessionInfo;

-(NSUInteger)sessionCount;

-(Session *)sessionAtIndex:(NSUInteger)index;

+(NSArray*)getArrayOfSessions;

@end
