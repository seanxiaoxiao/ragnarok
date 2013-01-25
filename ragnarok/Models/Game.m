//
//  Game.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Game.h"

@implementation Game
@synthesize round;
@synthesize phase;

- (void)finishPhase
{
    if (self.phase == homePhase) {
        phase = enemyPhase;
    }
    else {
        phase = homePhase;
        round = round + 1;
    }
}


@end
