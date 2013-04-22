//
//  MoveAction.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import "Action.h"
#import "Character.h"
#import "MoveToCharacterAction.h"
#import "Game.h"

@implementation MoveToCharacterAction

- (void)doActionTo: (id)target
{
    EnemyCharacter *activeCharacer = [Game sharedGame].activeEnemy;
}

@end
