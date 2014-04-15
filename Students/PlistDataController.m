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
	
	NSArray *defaultPList = [[NSArray alloc] init];
	defaultPList = [self makeNSArrayFromPlistTitle:sourcePList];
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
//	NSString *plistPath = [self makePlistPathWithTitle:plistTitle];
	
    NSMutableArray *originalPlist = [[NSMutableArray alloc] initWithArray:[self makeNSArrayFromPlistTitle:plistTitle]];
    [originalPlist addObject:addToArray];
    NSArray *updatedArray = [[NSArray alloc] initWithArray:originalPlist];
	
	[[NSUserDefaults standardUserDefaults] setObject:updatedArray forKey:plistTitle];
	[[NSUserDefaults standardUserDefaults] synchronize];
//    [updatedArray writeToFile:plistPath atomically:YES];
}

+(void)removeObjectFromObjectArray:(NSArray*)objectArray atIndex:(int)index {
	NSMutableArray *oldArray = [[NSMutableArray alloc] initWithArray:objectArray];
	[oldArray removeObjectAtIndex:index]; // remove that object from our array
	
	NSMutableArray *newObjectsData = [[NSMutableArray alloc] init];
	NSString *objectKey = [[NSString alloc] init];
	
	for (id object in oldArray) { // put each task object from the modified array into this new one
		[newObjectsData addObject:[object prepareForUpload]];
		// Use the last object in the array to determine what the object key should be
		if ([newObjectsData count] == [oldArray count]) {
			objectKey = [self getPlistNameForObject:object];
		}
	}

	
	// Upload the new data to replace the old list
	[[NSUserDefaults standardUserDefaults] setObject:newObjectsData forKey:objectKey];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
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
//+(NSString*)makePlistPathWithTitle:(NSString*)plistTitle {
//    return [[NSBundle mainBundle] pathForResource:plistTitle ofType:@"plist"];
//}
//
//+(NSArray*)makeNSArrayFromPlistPath:(NSString*)plistPath {
//	
//	NSArray *defaultPList = [NSArray arrayWithContentsOfFile:plistPath];
//	return defaultPList;
//}

+(NSArray*)makeNSArrayFromPlistTitle:(NSString*)plistTitle {
	
//	NSString *plistPath = [[NSString alloc] init];
//	plistPath = [self makePlistPathWithTitle:plistTitle];
	NSArray *defaultPList = [[[NSUserDefaults standardUserDefaults] arrayForKey:plistTitle] copy];
	return defaultPList;
}

+(void)convertPListsToNSUserDefaults:(NSString*)plistTitle{
	
	NSArray *defaultPList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistTitle ofType:@"plist"]];
	NSArray *plistArray = [[NSArray alloc] initWithArray:defaultPList];
	[[NSUserDefaults standardUserDefaults] setObject:plistArray forKey:plistTitle];
	[[NSUserDefaults standardUserDefaults] synchronize];
}
@end
