//
//  AttackAction.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import "AttackAction.h"
#import "EnemyCharacter.h"
#import "Game.h"
#import "Constants.h"

@implementation AttackAction

- (void)doActionTo: (id)target
{
    if (target) {
        EnemyCharacter *activeCharacer = [Game sharedGame].activeEnemy;
        NSMutableDictionary *orientationData = [[NSMutableDictionary alloc] init];
        [orientationData setValue:[NSNumber numberWithInt:activeCharacer.characterId] forKey:@"CharacterId"];
        [orientationData setValue:[NSNumber numberWithInt:[target col]] forKey:@"TargetCol"];
        [orientationData setValue:[NSNumber numberWithInt:[target row]] forKey:@"TargetRow"];
        NSNotification *notification = [NSNotification notificationWithName:EVENT_CHARACTER_DECIDE_ATTACK object:nil userInfo:orientationData];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}

@end
