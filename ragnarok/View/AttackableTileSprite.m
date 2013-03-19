//
//  AttackableTileSprite.m
//  ragnarok
//
//  Created by Xiao Xiao on 3/17/13.
//
//

#import "AttackableTileSprite.h"
#import "Constants.h"

@implementation AttackableTileSprite
@synthesize characterId;
@synthesize col;
@synthesize row;

+ (id)sprite
{
	return [[[super alloc] initWithFile:@"attackabletile.png" rect:CGRectMake(0, 0, 24, 24)] autorelease];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    BOOL within = [self containsTouchLocation:touch];
    if (within) {
        NSMutableDictionary *orientationData = [[NSMutableDictionary alloc] init];
        [orientationData setValue:[NSNumber numberWithInt:self.characterId] forKey:@"CharacterId"];
        [orientationData setValue:[NSNumber numberWithInt:self.col] forKey:@"TargetCol"];
        [orientationData setValue:[NSNumber numberWithInt:self.row] forKey:@"TargetRow"];
        NSNotification *notification = [NSNotification notificationWithName:EVENT_CHARACTER_DECIDE_ATTACK object:nil userInfo:orientationData];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
    return !within;
}

- (void)onEnter {
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];
    [super onEnter];
}

- (BOOL)containsTouchLocation:(UITouch *)touch
{
    return CGRectContainsPoint(self.rect, [self convertTouchToNodeSpaceAR:touch]);
}

- (CGRect)rect
{
    CGSize s = [self.displayFrame rect].size;
    return CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
}

@end
