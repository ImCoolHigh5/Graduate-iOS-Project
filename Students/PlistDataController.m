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

// A universal Data Controller, imported in the .PCH file and defined as 'plistDC' for easier access
@implementation PlistDataController

#pragma mark - Universal Class Methods

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

// Both a helper method and for use with other data controllers
// Used to retrieve raw data from NSUserDefaults
+(NSArray*)makeNSArrayFromPlistTitle:(NSString*)plistTitle {
	
	NSArray *defaultPList = [[[NSUserDefaults standardUserDefaults] arrayForKey:plistTitle] copy];
	return defaultPList;
}

// Allows any object to be passed in and added to the appropriate Plist
// Will use the getPlistNameForObject to find the correct Plist to get and replace
+(void)addToPlistObject:(id)newEntity {
    
	// The following instance method returns a dictionary version of the object
    NSDictionary *addToArray = [[NSDictionary alloc] init];
    addToArray = [newEntity prepareForUpload]; // All objects should have this method (create superclass?)
    
	// The right Plist title is chosen
	NSString *plistTitle = [self getPlistNameForObject:newEntity];
	
	// Updates the array of items pulled from the appropriate Plist...
    NSMutableArray *originalPlist = [[NSMutableArray alloc] initWithArray:[self makeNSArrayFromPlistTitle:plistTitle]];
    [originalPlist addObject:addToArray];
    NSArray *updatedArray = [[NSArray alloc] initWithArray:originalPlist];
	
	// ...and is stuffed right back in that Plist in its updated condition
	[[NSUserDefaults standardUserDefaults] setObject:updatedArray forKey:plistTitle];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

// Returns just the ID Numbers to be used for other Data Controllers
// Intended for use with a Class Roster feature
+(NSArray*)getIDsFromPlist:(NSString*)sourcePList {
	
	// Makes sure a Plist Title was passed
	if (sourcePList) {
		// Creates an array from the passed Plist type
		NSArray *defaultPList = [[NSArray alloc] initWithArray:[self makeNSArrayFromPlistTitle:sourcePList]];
		
		// A mutable array is then filled with the idNumbers of the retrieved entities
		NSMutableArray *fillMeWithIDs = [[NSMutableArray alloc] init];
		for (NSDictionary *entity in defaultPList) {
			[fillMeWithIDs addObject:entity[ID_NUMBER]];
		}
		// The array is made unmutable for memory conservation before it is returned
		NSArray *finishedArray = [[NSArray alloc] initWithArray:fillMeWithIDs];
		return finishedArray;
	}
	return nil;
}

#pragma mark - Helper Methods

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

#pragma mark - Preset Data Generation

// Uses stored Plists to fill NSUserDefaults with prefabricated Entities
+(void)convertPListsToNSUserDefaults:(NSString*)plistTitle{
	
	NSArray *defaultPList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistTitle ofType:@"plist"]];
	NSArray *plistArray = [[NSArray alloc] initWithArray:defaultPList];
	[[NSUserDefaults standardUserDefaults] setObject:plistArray forKey:plistTitle];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

// Passing the index to the method below was an issue so the update is done locally instead
/*
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
 */
@end
