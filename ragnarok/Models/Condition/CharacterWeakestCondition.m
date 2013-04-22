//
//  CharacterWeakest.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import "CharacterWeakestCondition.h"
#import "Character.h"
#import "Action.h"

@implementation CharacterWeakestCondition

- (BOOL) match:(NSArray *)reachableCharacters
{
    return [reachableCharacters count] > 0;
}

- (void) doAction:(NSArray *)reachableCharacters
{
    int maxHP = 100000;
    Character *target = nil;
    for (Character *character in reachableCharacters) {
        if (character.healthPoint < maxHP) {
            maxHP = character.healthPoint;
            target = character;
        }
    }
    [self.action doActionTo:target];
}

@end
