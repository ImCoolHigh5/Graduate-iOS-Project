//
//  MSCounty.h
//  Students
//
//  Created by Jason Welch on 7/8/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCounty : NSObject

- (id) initWithName:(NSString*)name;
-(NSNumber*) fixCountyRequirementForSubject:(NSString*)subjectKey;
+ (NSArray*)getCountyNames;

@end
