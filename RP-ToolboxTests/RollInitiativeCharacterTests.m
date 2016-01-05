//
//  RollInitiativeCharacterTests.m
//  RP-Toolbox
//
//  Created by Craig Vella on 1/4/16.
//  Copyright © 2016 Resolution Technologies. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RollInitiativeCharacter.h"

@interface RollInitiativeCharacterTests : XCTestCase

@end

@implementation RollInitiativeCharacterTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testGreaterPlayer {
    RollInitiativeCharacter * GreaterPlayer = [RollInitiativeCharacter CharacterWithSuccessCount:5 TriumphCount:0 AdvantageCount:0 Enemy:NO];
    RollInitiativeCharacter * LessPlayer = [RollInitiativeCharacter CharacterWithSuccessCount:4 TriumphCount:0 AdvantageCount:0 Enemy:NO];
    XCTAssertTrue([GreaterPlayer isGreaterThan:LessPlayer]);
    XCTAssertFalse([LessPlayer isGreaterThan:GreaterPlayer]);
}

- (void)testEqualPlayer {
    RollInitiativeCharacter * EqualPlayer1 = [RollInitiativeCharacter CharacterWithSuccessCount:5 TriumphCount:0 AdvantageCount:0 Enemy:NO];
    RollInitiativeCharacter * EqualPlayer2 = [RollInitiativeCharacter CharacterWithSuccessCount:5 TriumphCount:0 AdvantageCount:0 Enemy:NO];
    XCTAssertFalse([EqualPlayer1 isGreaterThan:EqualPlayer2]);
    XCTAssertFalse([EqualPlayer2 isGreaterThan:EqualPlayer1]);
}

- (void)testPlayerGreaterThanEqualEnemy {
    RollInitiativeCharacter * EqualPlayer = [RollInitiativeCharacter CharacterWithSuccessCount:5 TriumphCount:0 AdvantageCount:2 Enemy:NO];
    RollInitiativeCharacter * EqualEnemy = [RollInitiativeCharacter CharacterWithSuccessCount:5 TriumphCount:0 AdvantageCount:2 Enemy:YES];
    XCTAssertTrue([EqualPlayer isGreaterThan:EqualEnemy]);
    XCTAssertFalse([EqualEnemy isGreaterThan:EqualPlayer]);
}

- (void)testEnemyGreaterThanPlayer {
    RollInitiativeCharacter * LessPlayer = [RollInitiativeCharacter CharacterWithSuccessCount:5 TriumphCount:0 AdvantageCount:3 Enemy:NO];
    RollInitiativeCharacter * GreaterEnemy = [RollInitiativeCharacter CharacterWithSuccessCount:5 TriumphCount:0 AdvantageCount:4 Enemy:YES];
    XCTAssertTrue([GreaterEnemy isGreaterThan:LessPlayer]);
}

@end
