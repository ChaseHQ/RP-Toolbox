//
//  RollInitiativeViewController.h
//  RP-Toolbox
//
//  Created by Craig Vella on 12/31/15.
//  Copyright © 2015 Resolution Technologies. All rights reserved.
//

#ifndef RollInitiativeViewController_h
#define RollInitiativeViewController_h

#import <UIKit/UIKit.h>
#import "RollInitiativeCharacter.h"

@interface RollInitiativeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray * rollInitiativeCharacters;
}

@property (weak) IBOutlet UITableView * _tableView;

- (void)addCharacter:(RollInitiativeCharacter *) character;


@end

#endif /* RollInitiativeViewController_h */
