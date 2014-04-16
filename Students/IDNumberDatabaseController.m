//
//  IDNumberDatabaseController.m
//  Students
//
//  Created by Jason Welch on 4/10/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import "IDNumberDatabaseController.h"
#import "PlistDataController.h"

@implementation IDNumberDatabaseController

// Adds a new item to the end of this list of idNumbers and returns the new number
// This avoids duplicate references, especially since all entities pull from one idNumber source
-(int)getIDNumberForNewEntityWithType:(NSString*)entityType {

	// Get the list of numbers from the IDNumDB.plist
    NSMutableArray *idNumDB = [[NSMutableArray alloc] initWithArray:[plistDC makeNSArrayFromPlistTitle:
																	ID_NUMBER_DATABASE_PLIST_TITLE]];
	// The last item from this list is pulled
	NSDictionary *lastEntity = [[NSDictionary alloc] initWithDictionary:[idNumDB lastObject]];
    // Its idNumber is accessed and increased by 1
	int newIDNumber = [lastEntity[ID_NUMBER] intValue];
    newIDNumber++;
    // We will make a new last Entity
		NSString *lastIDNumber = [NSString stringWithFormat:@"%i",newIDNumber];
	NSDictionary *newLastEntity = @{ ID_NUMBER : lastIDNumber, ID_TYPE : entityType,};

	// Add this new entity to the Array
	[idNumDB addObject:newLastEntity];
	
	// Update the IDNumDB.plist with this updated array
	NSArray *newIDNumDB = [[NSArray alloc] initWithArray:idNumDB];
	[[NSUserDefaults standardUserDefaults] setObject:newIDNumDB forKey:ID_NUMBER_DATABASE_PLIST_TITLE];
    
	// The new last number is returned to be assigned to a new Entity
	return newIDNumber;
}

@end
