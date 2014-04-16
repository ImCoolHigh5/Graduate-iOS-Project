//
//  GuardianDataController.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Guardian;

@interface GuardianDataController : NSObject

#pragma mark - Public Methods

-(NSUInteger)guardianCount;

-(Guardian *)guardianAtIndex: (NSUInteger)index;

+(NSArray*)getGuardiansForStudentWithGuardianIDArray:(NSArray*)guardianIDs;


@end
