//
//  CharacterNearest.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import "CharacterNearestCondition.h"
#import "EnemyCharacter.h"
#import "Game.h"
#import "Action.h"
#import "Stage.h"

@implementation CharacterNearestCondition
@synthesize action;

- (BOOL) match:(NSArray *)reachableCharacters
{
    return [reachableCharacters count] > 0;
}

- (void) doAction:(NSArray *)reachableCharacters
{
    int enenmyCol = [Game sharedGame].activeEnemy.col;
    int enenmyRow = [Game sharedGame].activeEnemy.row;
    int maxDistance = [[Game sharedGame].activeEnemy moves] * [Game sharedGame].activeEnemy.moves;
    Character *target = nil;
    for (Character *character in reachableCharacters) {
        int distance = (character.col - enenmyCol) * (character.col - enenmyCol) + (character.row - enenmyRow) * (character.row - enenmyRow);
        if (distance < maxDistance) {
            maxDistance = distance;
            target = character;
        }
    }
    [self.action doActionTo:target];
}



@end
