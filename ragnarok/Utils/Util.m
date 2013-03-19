//
//  Util.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/31/13.
//
//

#import "Util.h"
#import "StageLayer.h"
#import "Character.h"
#import "Constants.h"

@implementation Util

+ (StageLayer *) fetchStageLayer
{
    CCArray *currentLayers = [[CCDirector sharedDirector] runningScene].children;
    for (int i = 0; i < [currentLayers count]; i++) {
        NSLog(@"%@", [[currentLayers objectAtIndex:i] class]);
        if ([[currentLayers objectAtIndex:i] isKindOfClass:[StageLayer class]]) {
            return [currentLayers objectAtIndex:i];
        }
    }
    return nil;
}

+ (CCMenu *) getMenuByCharacter:(Character *)chraracter
{
    [CCMenuItemFont setFontSize:20];
    CGSize size = [[CCDirector sharedDirector] winSize];
   
    // Achievement Menu Item using blocks
    CCMenuItem *attackItem = [CCMenuItemFont itemWithString:@"Attack" block:^(id sender) {
        NSMutableDictionary *orientationData = [[NSMutableDictionary alloc] init];
        [orientationData setValue:[NSNumber numberWithInt:chraracter.characterId] forKey:@"CharacterId"];
        NSNotification *notification = [NSNotification notificationWithName:EVENT_CHARACTER_READY_ATTACK object:nil userInfo:orientationData];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }];
    
    CCMenuItem *doneItem = [CCMenuItemFont itemWithString:@"Done" block:^(id sender) {
        NSMutableDictionary *orientationData = [[NSMutableDictionary alloc] init];
        [orientationData setValue:[NSNumber numberWithInt:chraracter.characterId] forKey:@"CharacterId"];
        NSNotification *notification = [NSNotification notificationWithName:EVENT_CHARACTER_DONE_ACTION object:nil userInfo:orientationData];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }];
    
    CCMenu *menu = [CCMenu menuWithItems:attackItem, doneItem, nil];
    
    [menu alignItemsVertically];
    [menu setPosition:ccp(size.width/2, size.height/2 - 50)];

    return menu;
}

@end
