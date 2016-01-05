//
//  AddCharacterViewController.m
//  RP-Toolbox
//
//  Created by Craig Vella on 1/1/16.
//  Copyright © 2016 Resolution Technologies. All rights reserved.
//

#import "AddCharacterViewController.h"

@implementation AddCharacterViewController

@synthesize successCount, successStepper, advantageCount, advantageStepper, triumphCount, triumphStepper, enemyPlayerSelect, rollInitVC;

- (IBAction)addCharacter:(id)sender {
    [rollInitVC addCharacter:[RollInitiativeCharacter CharacterWithSuccessCount:(int)successStepper.value TriumphCount:(int)triumphStepper.value AdvantageCount:(int)advantageStepper.value Enemy:(enemyPlayerSelect.selectedSegmentIndex ? true : false)]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)stepperUpdate:(id)sender {
    UIStepper * stepper = (UIStepper *) sender;
    switch (stepper.tag) {
        case 1:
            [successCount setText:[NSString stringWithFormat:@"%i",(int)stepper.value]];
            break;
        case 2:
            [advantageCount setText:[NSString stringWithFormat:@"%i",(int)stepper.value]];
            break;
        case 3:
            [triumphCount setText:[NSString stringWithFormat:@"%i",(int)stepper.value]];
            break;
    }
}

@end