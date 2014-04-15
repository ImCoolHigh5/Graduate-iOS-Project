//
//  PlistDataController.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "PlistDataController.h"
#import "Student.h"
#import "Staff.h"
#import "Guardian.h"
#import "Session.h"
#import "Schedule.h"
#import "Room.h"


@implementation PlistDataController

// Returns an NSDictionary of the entity in the passed Plist with the matching IDNumber...if one exists
+(NSDictionary *)getEntityWithIDNumber:(int)idNumber inPlist:(NSString*)sourcePList {
	
//	NSString *pathToPList = [[NSBundle mainBundle] pathForResource:sourcePList ofType:@"plist"];
	NSArray *defaultPList = [[NSArray alloc] init];
	defaultPList = [self makeNSArrayFromPlistPath:[self makePlistPathWithTitle:sourcePList]];
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
+(NSArray*)getIDsFromPlist:(NSString*)sourcePList {
	if (sourcePList) {
		//	NSString *pathToPList = [[NSBundle mainBundle] pathForResource:sourcePList ofType:@"plist"];
		NSArray *defaultPList = [[NSArray alloc] initWithArray:[self makeNSArrayFromPlistTitle:sourcePList]];
		NSMutableArray *fillMeWithIDs = [[NSMutableArray alloc] init];
		
		for (NSDictionary *entity in defaultPList) {
			//		NSString *idNumber = [NSString stringWithFormat@"%@", entity[ID_NUMBER]];
			[fillMeWithIDs addObject:entity[ID_NUMBER]]; // Converty to NSString?
		}
		NSArray *finishedArray = [[NSArray alloc] initWithArray:fillMeWithIDs];
		return finishedArray;
	}
	return nil;
}

+(void)addToPlistObject:(id)newEntity {
    // Will use the getPlistNameForObject to find the correct Plist to get and replace
    NSDictionary *addToArray = [[NSDictionary alloc] init];
	// The following instance method returns a dictionary version of the object
    addToArray = [newEntity prepareForUpload]; // All objects should have this method (create protocol?)
    
	NSString *plistTitle = [self getPlistNameForObject:newEntity];
	NSString *plistPath = [self makePlistPathWithTitle:plistTitle];
	
    NSMutableArray *originalPlist = [[NSMutableArray alloc] initWithArray:[self makeNSArrayFromPlistPath:plistPath]];
    [originalPlist addObject:addToArray];
    NSArray *updatedArray = [[NSArray alloc] initWithArray:originalPlist];
    [updatedArray writeToFile:plistPath atomically:YES];
}

+(NSString*)getPlistNameForObject:(id)questionableClass {
    if ([questionableClass isKindOfClass:[Student class]]) {
        return STUDENT_PLIST_TITLE;
    } else if ([questionableClass isKindOfClass:[Staff class]]) {
        return STAFF_PLIST_TITLE;
    } else if ([questionableClass isKindOfClass:[Guardian class]]) {
        return GUARDIAN_PLIST_TITLE;
    } else if ([questionableClass isKindOfClass:[Session class]]) {
        return SESSION_PLIST_TITLE;
    } else if ([questionableClass isKindOfClass:[Schedule class]]) {
        return SCHEDULE_PLIST_TITLE;
    } else if ([questionableClass isKindOfClass:[Room class]]) {
        return ROOM_PLIST_TITLE;
    }
	
    return nil;
}


// At first I was worried that having all three of these was a tad redundant but each is used independently at least once through the application
+(NSString*)makePlistPathWithTitle:(NSString*)plistTitle {
    return [[NSBundle mainBundle] pathForResource:plistTitle ofType:@"plist"];
}

+(NSArray*)makeNSArrayFromPlistPath:(NSString*)plistPath {
	
	NSArray *defaultPList = [NSArray arrayWithContentsOfFile:plistPath];
	return defaultPList;
}

+(NSArray*)makeNSArrayFromPlistTitle:(NSString*)plistTitle {
	
	NSString *plistPath = [[NSString alloc] init];
	plistPath = [self makePlistPathWithTitle:plistTitle];
	NSArray *defaultPList = [NSArray arrayWithContentsOfFile:plistPath];
	return defaultPList;
}

+(void)convertPListsToNSUserDefaults:(NSString*)plistTitle{
	
	NSArray *plistArray = [[NSArray alloc] initWithArray:[self makeNSArrayFromPlistTitle:plistTitle]];
	[[NSUserDefaults standardUserDefaults] setObject:plistArray forKey:plistTitle];
	[[NSUserDefaults standardUserDefaults] synchronize];
}
@end
