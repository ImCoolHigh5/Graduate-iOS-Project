//
//  GuardianDataController.m
//  Students
//
//  Created by Jason Welch on 4/6/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//


#import "GuardianDataController.h"
#import "Guardian.h"

@interface GuardianDataController ()

@property (nonatomic, readonly) NSMutableArray *guardianList;

@end

@implementation GuardianDataController

#pragma mark - Custom Initialization
// Initialization is overridden to make in instance something like an array
-(id) init {
	self = [super init];
	
	if(self) {
		_guardianList = [[NSMutableArray alloc] init];
		[self initializeDefaultGuardians];
		return self;
	}
	return nil;
}

-(void) initializeDefaultGuardians {
	
	NSString *pathToGuardianPList = [[NSBundle mainBundle] pathForResource:GUARDIAN_PLIST_TITLE ofType:@"plist"];
	NSArray *defaultGuardianPList = [NSArray arrayWithContentsOfFile:pathToGuardianPList];
	for (NSDictionary *guardianInfo in defaultGuardianPList) {
		[_guardianList addObject:[self makeGuardianFromNSDictionary:guardianInfo]];
	}
}

// The guardian list is kept private, but data can be accessed through the following methods
#pragma mark - Instance Methods

// how many guardians are there?
-(NSUInteger)guardianCount {
	return [self.guardianList count];
}

// which guardian is this??
-(Guardian *)guardianAtIndex:(NSUInteger)index {
	return [self.guardianList objectAtIndex:index];
}

#pragma mark - Helper method
// Creates a new Guardian object from methods passed to it, using the Guardian custom init
-(Guardian*)makeGuardianFromNSDictionary:(NSDictionary*)guardianRaw {
	Guardian *newGuardian = [[Guardian alloc] initWithGuardianIDNumber:[guardianRaw[ID_NUMBER] intValue]
														  andFirstName:guardianRaw[FIRST_NAME]
														   andLastName:guardianRaw[LAST_NAME]
														andAreTheyMale:[guardianRaw[GENDER_IS_MALE] boolValue]
														andPhoneNumber:guardianRaw[PHONE_NUMBER_FOR_GUARDIAN]
														andHouseNumber:guardianRaw[HOUSE_NUMBER_FOR_GUARDIAN_ADDRESS]
															 andStreet:guardianRaw[STREET_FOR_GUARDIAN_ADDRESS]
															   andCity:guardianRaw[CITY_FOR_GUARDIAN_ADDRESS]
															  andState:guardianRaw[STATE_FOR_GUARDIAN_ADDRESS]
															andZipCode:[guardianRaw[ZIPCODE_FOR_GUARDIAN_ADDRESS] intValue]
													  andIsMainContact:[guardianRaw[IS_GUARDIAN_MAIN_CONTACT] boolValue]
												 andIsEmergencyContact:[guardianRaw[IS_GUARDIAN__EMERGENCY_CONTACT] boolValue]
											   andIsResidenceOfStudent:[guardianRaw[IS_GUARDIAN_LIVING_WITH_STUDENT] boolValue] ];
	
	return newGuardian;
}

#pragma mark - Class Method

+(NSArray*)getGuardiansForStudentWithGuardianIDArray:(NSArray*)guardianIDs {
	if (guardianIDs) {
		
		NSMutableArray *fillMeWithGuardians = [[NSMutableArray alloc] init];
		
		// Cycles through the array of guardianIDs
		for (int i = 0; i < [guardianIDs count]; i++) {
			// Gets an NSDictionary for the guardian with this idNumber
			NSDictionary *newGuardian = [[NSDictionary alloc] initWithDictionary:[plistDC getEntityWithIDNumber:[guardianIDs[i] intValue] inPlist:GUARDIAN_PLIST_TITLE]];
			//Turns the NSDictionary Item into a Guardian object and stuffs it in the MutableArray
			GuardianDataController *forInstanceMethods = [[GuardianDataController alloc] init];
			[fillMeWithGuardians addObject:[forInstanceMethods makeGuardianFromNSDictionary:newGuardian]];
			
		}
		// Remove Mutability
		NSArray *returnGuardians = [[NSArray alloc] initWithArray:fillMeWithGuardians];
		// Send it on back
		return returnGuardians;
	}
	else return nil;
}
@end