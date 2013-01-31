//
//  Character.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Character.h"

@implementation Character
@synthesize roundFinish;

- (void) finishRound {
    roundFinish = true;
}

- (void) startRound {
    roundFinish = false;
}

@end
