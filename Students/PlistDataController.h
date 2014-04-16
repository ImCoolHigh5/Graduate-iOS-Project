//
//  PlistDataController.h
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistDataController : NSObject

#pragma mark - Public Methods

+(NSDictionary *)getEntityWithIDNumber:(int)idNumber inPlist:(NSString*)sourcePList;
+(id)getValueUsingKeyValue:(NSString*)key forEntityWithIDNumber:(int)idNumber inPlist:(NSString*)sourcePList;
+(NSArray*)makeNSArrayFromPlistTitle:(NSString*)plistTitle;
+(void)addToPlistObject:(id)newEntity;
+(void)convertPListsToNSUserDefaults:(NSString*)plistTitle;

+(NSArray*)getIDsFromPlist:(NSString*)sourcePList;
//+(void)removeObjectFromObjectArray:(NSArray*)objectArray atIndex:(int)index;
@end
