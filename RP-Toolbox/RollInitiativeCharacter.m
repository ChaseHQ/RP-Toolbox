//
//  RollInitiativeCharacter.m
//  RP-Toolbox
//
//  Created by Craig Vella on 1/1/16.
//  Copyright © 2016 Resolution Technologies. All rights reserved.
//

#import "RollInitiativeCharacter.h"

@implementation RollInitiativeCharacter

@synthesize isEnemy, successCount, advantageCount, triumphCount;

+ (RollInitiativeCharacter *) CharacterWithSuccessCount:(int) successCount TriumphCount:(int) triumphCount AdvantageCount:(int) advantageCount Enemy:(BOOL) isEnemy {
    RollInitiativeCharacter * ric = [[RollInitiativeCharacter alloc] init];
    
    [ric setTriumphCount:triumphCount];
    [ric setSuccessCount:successCount];
    [ric setAdvantageCount:advantageCount];
    [ric setIsEnemy:isEnemy];
    
    return ric;
}

- (BOOL) isGreaterThan:(RollInitiativeCharacter *) otherCharacter {
    
    if ((self.successCount + self.triumphCount) > (otherCharacter.successCount + otherCharacter.triumphCount))
        return YES;
    
    
    if ((self.successCount + self.triumphCount) == (otherCharacter.successCount + otherCharacter.triumphCount)){
        if (self.advantageCount > otherCharacter.advantageCount)
            return YES;
        else if (self.advantageCount == otherCharacter.advantageCount) {
            if (otherCharacter.isEnemy && !self.isEnemy)
                return YES;
        }
    }
    
    return NO;
}


@end