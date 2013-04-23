//
//  EnemyCharacter.h
//  ragnarok
//
//  Created by Xiao Xiao on 4/1/13.
//
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Condition.h"

@interface EnemyCharacter : Character

@property (atomic, retain) NSMutableArray *moveConditions;
@property (atomic, retain) NSMutableArray *attackConditions;
@property (atomic, assign) BOOL isMoving;
@property (atomic, assign) BOOL isAttacking;

- (void) moveNearToCol: (int)col andRow: (int)row;

- (void) moveAction;

- (void) attackAction;

@end
