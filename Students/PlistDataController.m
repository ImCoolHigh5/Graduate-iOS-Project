//
//  PlistDataController.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "PlistDataController.h"

@implementation PlistDataController

// Returns an NSDictionary of the entity in the passed Plist with the matching IDNumber...if one exists
+(NSDictionary *)getEntityWithIDNumber:(int)idNumber inPlist:(NSString*)sourcePList {
	
	NSString *pathToPList = [[NSBundle mainBundle] pathForResource:sourcePList ofType:@"plist"];
	NSArray *defaultPList = [NSArray arrayWithContentsOfFile:pathToPList];
	for (NSDictionary *entity in defaultPList) {
		if ([entity[ID_NUMBER] intValue] == idNumber) {
			return entity;
		}
	}
	return nil;
}

// Returns an value of an entity's property in the passed Plist with the matching IDNumber...if one exists
+(id)getValueUsingKeyValue:(NSString*)key forEntityWithIDNumber:(int)idNumber inPlist:(NSString*)sourcePList {
	
	NSDictionary* entity = [[NSDictionary alloc] init];
	if ([self getEntityWithIDNumber:idNumber inPlist:sourcePList]) {
		
		entity = [self getEntityWithIDNumber:idNumber inPlist:sourcePList];
		return entity[key];
	}
	
	return nil;
}

// Returns just the ID Numbers to be used for other Data Controllers
#warning Might want to get rid of this (not in use) NSArray can't hold int values
+(NSArray*)getIDsFromPlist:(NSString*)sourcePList {
	if (sourcePList) {
		NSString *pathToPList = [[NSBundle mainBundle] pathForResource:sourcePList ofType:@"plist"];
		NSArray *defaultPList = [NSArray arrayWithContentsOfFile:pathToPList];
		NSMutableArray *fillMeWithIDs = [[NSMutableArray alloc] init];
		
		for (NSDictionary *entity in defaultPList) {
			[fillMeWithIDs addObject:entity[ID_NUMBER]];
		}
		NSArray *finishedArray = [[NSArray alloc] initWithArray:fillMeWithIDs];
		return finishedArray;
	}
	return nil;
}
@end
