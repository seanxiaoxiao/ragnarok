//
//  EnemyCharacter.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/1/13.
//
//

#import "EnemyCharacter.h"
#import "Character.h"
#import "UnitCategory.h"
#import "cocos2d.h"
#import "Footman.h"
#import "Condition.h"
#import "Game.h"
#import "Stage.h"

@implementation EnemyCharacter

@synthesize moveConditions;
@synthesize attackConditions;

- (id)initWithUnitNo:(int) _unitNo
{
    self = [super initWithUnitNo:_unitNo];
    super.isEnemy = YES;
    return self;
}

- (void) moveToCol: (int)col andRow: (int)row
{
    
}

- (void) moveAction
{
    NSArray *reachableCharacters = [[Game sharedGame].stage reachableCharacters:self];
    for (Condition *condition in moveConditions) {
        if ([condition match:reachableCharacters]) {
            [condition doAction:reachableCharacters];
        }
    }
}

- (void) attackAction
{
    NSArray *attackableCharacters = [[Game sharedGame].stage attackableCharacters:self];
    for (Condition *condition in attackConditions) {
        if ([condition match:attackableCharacters]) {
            [condition doAction:attackableCharacters];
        }
    }
}

@end
