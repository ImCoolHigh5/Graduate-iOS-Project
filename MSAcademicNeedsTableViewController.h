//
//  MSAcademicNeedsTableViewController.h
//  Students
//
//  Created by Jason Welch on 7/11/14.
//  Copyright (c) 2014 Stevenson University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSAcademicNeedsTableViewController : UITableViewController

#pragma mark - IBOutlets

@property (strong, nonatomic) IBOutlet UILabel *ENGNextRequiredCourseLabel;
@property (strong, nonatomic) IBOutlet UILabel *ENGCreditsLabel;
@property (strong, nonatomic) IBOutlet UIButton *ENGPassedButton;
@property (strong, nonatomic) IBOutlet UIButton *ENGUndoButton;


@property (strong, nonatomic) IBOutlet UILabel *SSNextRequiredCourseLabel;
@property (strong, nonatomic) IBOutlet UILabel *SSCreditsLabel;
@property (strong, nonatomic) IBOutlet UIButton *SSPassedButton;
@property (strong, nonatomic) IBOutlet UIButton *SSUndoButton;


@property (strong, nonatomic) IBOutlet UILabel *SCINextRequiredCourseLabel;
@property (strong, nonatomic) IBOutlet UILabel *SCICreditsLabel;
@property (strong, nonatomic) IBOutlet UIButton *SCIPassedButton;
@property (strong, nonatomic) IBOutlet UIButton *SCIUndoButton;


@property (strong, nonatomic) IBOutlet UILabel *MATHNextRequiredCourseLabel;
@property (strong, nonatomic) IBOutlet UILabel *MATHCreditsLabel;
@property (strong, nonatomic) IBOutlet UIButton *MATHPassedButton;
@property (strong, nonatomic) IBOutlet UIButton *MATHUndoButton;


@property (strong, nonatomic) IBOutlet UILabel *CAREERNextRequiredCourseLabel;
@property (strong, nonatomic) IBOutlet UILabel *CAREERCreditsLabel;
@property (strong, nonatomic) IBOutlet UIButton *CAREERPassedButton;
@property (strong, nonatomic) IBOutlet UIButton *CAREERUndoButton;

@property (strong, nonatomic) IBOutlet UILabel *MUSICreditsLabel;
@property (strong, nonatomic) IBOutlet UILabel *FLANGCreditsLabel;
@property (strong, nonatomic) IBOutlet UILabel *TECHCreditsLabel;
@property (strong, nonatomic) IBOutlet UILabel *PECreditsLabel;
@property (strong, nonatomic) IBOutlet UILabel *ARTCreditsLabel;
@property (strong, nonatomic) IBOutlet UILabel *HealthCreditsLabel;
@property (strong, nonatomic) IBOutlet UILabel *FinanceCreditsLabel;

@property (strong, nonatomic) IBOutlet UIButton *FLANGButton;
@property (strong, nonatomic) IBOutlet UIButton *PEButton;
@property (strong, nonatomic) IBOutlet UIButton *ARTButton;
@property (strong, nonatomic) IBOutlet UIButton *HealthButton;


@property (strong, nonatomic) IBOutlet UIButton *MilitaryScienceButton;
@property (strong, nonatomic) IBOutlet UILabel *ELECTIVESCreditsLabel;

#pragma mark - Public Properties



#pragma mark - IBActions

- (IBAction)ENGPassedButtonPressed:(UIButton *)sender;
- (IBAction)ENGUndoButtonPressed:(UIButton *)sender;

- (IBAction)SSPassedButtonPressed:(UIButton *)sender;
- (IBAction)SSUndoButtonPressed:(UIButton *)sender;

- (IBAction)SCIPassedButtonPressed:(UIButton *)sender;
- (IBAction)SCIUndoButtonPressed:(UIButton *)sender;

- (IBAction)MATHPassedButtonPressed:(UIButton *)sender;
- (IBAction)MATHUndoButtonPressed:(UIButton *)sender;

- (IBAction)CAREERPassedButtonPressed:(UIButton *)sender;
- (IBAction)CAREERUndoButtonPressed:(UIButton *)sender;

- (IBAction)OTHERUndoButtonPressed:(UIButton *)sender;
- (IBAction)MUSICButtonPressed:(UIButton *)sender;
- (IBAction)FLANGButtonPressed:(UIButton *)sender;
- (IBAction)TECHButtonPressed:(UIButton *)sender;
- (IBAction)PEButtonPressed:(UIButton *)sender;
- (IBAction)ARTButtonPressed:(UIButton *)sender;
- (IBAction)HealthButtonPressed:(UIButton *)sender;
- (IBAction)EconomicsButtonPressed:(UIButton *)sender;
- (IBAction)FinancialLitButtonPressed:(UIButton *)sender;

- (IBAction)ELECTIVESUndoButtonPressed:(UIButton *)sender;
- (IBAction)MilitaryScienceButtonPressed:(UIButton *)sender;
- (IBAction)BroadcastMediaButtonPressed:(UIButton *)sender;
- (IBAction)LifeSkillsButtonPressed:(UIButton *)sender;
- (IBAction)CrWritingButtonPressed:(UIButton *)sender;
- (IBAction)GenPsychButtonPressed:(UIButton *)sender;




#pragma mark - Public Methods





@end
