//
//  IDNumberDatabaseController.h
//  Students
//
//  Created by Jason Welch on 4/10/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDNumberDatabaseController : NSObject

-(int)getIDNumberForNewEntityWithType:(NSString*)entityType;

@end
