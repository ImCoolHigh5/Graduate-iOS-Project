//
//  PlistDataController.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistDataController : NSObject

+(NSDictionary *)getEntityWithIDNumber:(int)idNumber inPlist:(NSString*)sourcePList;
+(id)getValueUsingKeyValue:(NSString*)key forEntityWithIDNumber:(int)idNumber inPlist:(NSString*)sourcePList;
+(NSArray*)getIDsFromPlist:(NSString*)sourcePList;
@end
