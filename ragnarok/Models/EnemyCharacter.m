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
#import "Cell.h"
#import "Constants.h"

@implementation EnemyCharacter

@synthesize moveConditions;
@synthesize attackConditions;

- (id)initWithUnitNo:(int) _unitNo
{
    self = [super initWithUnitNo:_unitNo];
    super.isEnemy = YES;
    self.moveConditions = [[NSMutableArray alloc] init];
    self.attackConditions = [[NSMutableArray alloc] init];
    return self;
}

- (void) moveNearToCol: (int)col andRow: (int)row
{
    NSMutableArray *movableCells = [[Game sharedGame].stage movableTiles:self];
    Cell *currentCell = [[Cell alloc] init];
    currentCell.col = self.col;
    currentCell.row = self.row;
    [movableCells insertObject:currentCell atIndex:0];
    for (Cell *cell in movableCells) {
        if ([cell isNextToCol:col andRow:row]) {
            NSMutableDictionary *orientationData = [[NSMutableDictionary alloc] init];
            [orientationData setValue:[NSNumber numberWithInt:self.characterId] forKey:@"CharacterId"];
            [orientationData setValue:[NSNumber numberWithInt:cell.col] forKey:@"TargetCol"];
            [orientationData setValue:[NSNumber numberWithInt:cell.row] forKey:@"TargetRow"];
            NSNotification *notification = [NSNotification notificationWithName:EVENT_CHARACTER_MOVE object:nil userInfo:orientationData];
            [[NSNotificationCenter defaultCenter] postNotification:notification];
            return;
        }
    }
}

- (void) moveAction
{
    NSArray *reachableCharacters = [[Game sharedGame].stage reachableCharacters:self];
    for (Condition *condition in moveConditions) {
        if ([condition match:reachableCharacters]) {
            NSLog(@"Matched %@", [condition class]);
            [condition doAction:reachableCharacters];
            return;
        }
    }
}

- (void) attackAction
{
    NSArray *attackableCharacters = [[Game sharedGame].stage attackableCharacters:self];
    for (Condition *condition in attackConditions) {
        if ([condition match:attackableCharacters]) {
            [condition doAction:attackableCharacters];
            return;
        }
    }
}


@end
