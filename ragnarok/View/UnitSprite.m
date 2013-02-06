//
//  UnitSprite.m
//  ragnarok
//
//  Created by Xiao Xiao on 2/5/13.
//
//

#import "UnitSprite.h"
#import "Constants.h"

@implementation UnitSprite
@synthesize characterId;

+ (id)spriteWithFile:(NSString*)filename rect:(CGRect)rect
{
	return [[[super alloc] initWithFile:filename rect:rect] autorelease];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    BOOL within = [self containsTouchLocation:touch];
    if (within) {
        NSMutableDictionary *orientationData = [[NSMutableDictionary alloc] init];
        [orientationData setValue:[NSNumber numberWithInt:self.characterId] forKey:@"CharacterId"];
        NSNotification *notification = [NSNotification notificationWithName:EVENT_CHARACTER_TOUCH object:nil userInfo:orientationData];
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
