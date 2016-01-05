//
//  AddCharacterViewController.h
//  RP-Toolbox
//
//  Created by Craig Vella on 1/1/16.
//  Copyright © 2016 Resolution Technologies. All rights reserved.
//

#ifndef AddCharacterViewController_h
#define AddCharacterViewController_h

#import <UIKit/UIKit.h>
#import "RollInitiativeCharacter.h"
#import "RollInitiativeViewController.h"

@interface AddCharacterViewController : UIViewController

@property (weak) IBOutlet UIStepper * successStepper;
@property (weak) IBOutlet UIStepper * advantageStepper;
@property (weak) IBOutlet UIStepper * triumphStepper;

@property (weak) IBOutlet UILabel * successCount;
@property (weak) IBOutlet UILabel * advantageCount;
@property (weak) IBOutlet UILabel * triumphCount;

@property (weak) IBOutlet UISegmentedControl * enemyPlayerSelect;
@property (weak) IBOutlet RollInitiativeViewController * rollInitVC;

- (IBAction)addCharacter:(id)sender;
- (IBAction)stepperUpdate:(id)sender;

@end

#endif /* AddCharacterViewController_h */
