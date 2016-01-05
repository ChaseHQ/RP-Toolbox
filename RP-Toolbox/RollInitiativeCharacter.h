//
//  RollInitiativeCharacter.h
//  RP-Toolbox
//
//  Created by Craig Vella on 1/1/16.
//  Copyright © 2016 Resolution Technologies. All rights reserved.
//

#ifndef RollInitiativeCharacter_h
#define RollInitiativeCharacter_h

#import <Foundation/Foundation.h>

@interface RollInitiativeCharacter : NSObject

@property int triumphCount;
@property int successCount;
@property int advantageCount;
@property BOOL isEnemy;

+ (RollInitiativeCharacter *) CharacterWithSuccessCount:(int) successCount TriumphCount:(int) triumphCount AdvantageCount:(int) advantageCount Enemy:(BOOL) isEnemy;

- (BOOL) isGreaterThan:(RollInitiativeCharacter *) otherCharacter;

@end

#endif /* RollInitiativeCharacter_h */
