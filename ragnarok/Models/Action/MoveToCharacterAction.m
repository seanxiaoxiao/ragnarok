//
//  MoveAction.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import "Action.h"
#import "EnemyCharacter.h"
#import "MoveToCharacterAction.h"
#import "Game.h"

@implementation MoveToCharacterAction

- (void)doActionTo: (id)target
{
    if (target) {
        EnemyCharacter *activeCharacer = [Game sharedGame].activeEnemy;
        activeCharacer.isMoving = YES;
        [activeCharacer moveNearToCol:[target col] andRow:[target row]];
    }
}

@end
