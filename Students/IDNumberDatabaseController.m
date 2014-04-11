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
-(int)getIDNumberForNewEntityWithType:(NSString*)entityType {
	
    NSMutableArray *idNumDB = [[NSMutableArray alloc] initWithArray:[plistDC makeNSArrayFromPlistTitle:entityType]];
	NSDictionary *lastEntity = [[NSDictionary alloc] init];
    lastEntity = [idNumDB lastObject];
    int newIDNumber = [lastEntity[ID_NUMBER] intValue];
    newIDNumber++;
    // We will make a new last Entity
	NSString *lastIDNumber = [NSString stringWithFormat:@"%i",newIDNumber];
	[lastEntity setValue:lastIDNumber forKey:ID_NUMBER];
    [lastEntity setValue:entityType forKey:ID_TYPE];
	// Add this new entity to the Array
	[idNumDB addObject:lastEntity];
	
	NSArray *newIDNumDB = [[NSArray alloc] initWithArray:idNumDB];
	[newIDNumDB writeToFile:[plistDC makePlistPathWithTitle:ID_NUMBER_DATABASE_PLIST_TITLE] atomically:YES];
    /*** write new entity to IDNumDB ***/
    return newIDNumber;
}

@end
