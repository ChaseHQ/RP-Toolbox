//
//  RollInitiativeViewController.m
//  RP-Toolbox
//
//  Created by Craig Vella on 12/31/15.
//  Copyright © 2015 Resolution Technologies. All rights reserved.
//

#import "RollInitiativeViewController.h"
#import "RollInitiativeTableViewCell.h"
#import "AddCharacterViewController.h"

@implementation RollInitiativeViewController

@synthesize _tableView;

- (void) viewDidLoad {
    [super viewDidLoad];
    
    rollInitiativeCharacters = [[NSMutableArray alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [rollInitiativeCharacters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"RollInitiativeTableViewCell";
    
    RollInitiativeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[RollInitiativeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    RollInitiativeCharacter * character = [rollInitiativeCharacters objectAtIndex:indexPath.row];
    
    [cell.mainLabel setTextColor:(character.isEnemy ? [UIColor redColor] : [UIColor colorWithRed:.02f green:.56f blue:.1f alpha:1.0f])];
    [cell.triumphImage setHidden:(character.triumphCount == 0)];
    [cell.mainLabel setText:[NSString stringWithFormat:@"%i - %@ (S:%i - A:%i)",(indexPath.row + 1), (character.isEnemy ? @"Enemy Character" : @"Player Character"),character.successCount + character.triumphCount, character.advantageCount ]];
    
    return cell;
}

- (void)addCharacter:(RollInitiativeCharacter *) character {
    [rollInitiativeCharacters addObject:character];
    [self _sortInitiativeCharacters];
    [_tableView reloadData];
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [rollInitiativeCharacters removeObjectAtIndex:indexPath.row];
        [_tableView reloadData];
    }
}

- (void) _sortInitiativeCharacters {
    // Custom Bubble Sort the Characters
    if (rollInitiativeCharacters.count < 1) // No need to sort if there is 1 or 0 in the array
        return;
    
    NSMutableArray * sortedArray = [[NSMutableArray alloc] init];
    int maxBubbleCount = (int)rollInitiativeCharacters.count;
    
    for (int currentBubbleCount = 0; currentBubbleCount < maxBubbleCount; ++currentBubbleCount) {
        RollInitiativeCharacter * evalChar = (RollInitiativeCharacter *) [rollInitiativeCharacters objectAtIndex:0]; // Grab New Character @ 0 Index for Eval
        RollInitiativeCharacter * otherChar = nil;
        int currentHighestIndex = 0;
        for (int x = 1; x < rollInitiativeCharacters.count; ++x) { // Always Skip Eval of 1st in Array - It's the eval Char
            otherChar = (RollInitiativeCharacter *) [rollInitiativeCharacters objectAtIndex:x];
            if ([otherChar isGreaterThan:evalChar]) {
                currentHighestIndex = x;
                evalChar = otherChar;
            }
        }
        // The currentHighestIndex Contains Greatest of the Bubble Sort
        [sortedArray addObject:evalChar];
        [rollInitiativeCharacters removeObjectAtIndex:currentHighestIndex];
    }
    
    rollInitiativeCharacters = sortedArray;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"addCharacterSID"]) {
        AddCharacterViewController * acVC = [segue destinationViewController];
        acVC.rollInitVC = self;
    }
}

@end
