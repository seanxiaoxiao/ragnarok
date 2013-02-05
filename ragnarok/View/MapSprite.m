//
//  MapSprite.m
//  ragnarok
//
//  Created by Xiao Xiao on 2/5/13.
//
//

#import "MapSprite.h"
#import "cocos2d.h"

@implementation MapSprite

+(id)spriteWithFile:(NSString*)filename
{
	return [[[super alloc] initWithFile:filename] autorelease];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
//    if (![self containsTouchLocation:touch]) {
//        return NO;
//    }
//    CGPoint point = [self convertTouchToNodeSpaceAR:touch];
    return YES;
}
//
//- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
//{
//    CGPoint touchPoint = [touch locationInView:[touch view]];    
//    touchPoint = [[CCDirector sharedDirector] convertToUI:CGPointMake(touchPoint.x, touchPoint.y)];
//    
//    self.position = CGPointMake(touchPoint.x, touchPoint.y);
//}
//
//- (void) onEnter
//{
//    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
//    [super onEnter];
//}
//
//- (void) onExit
//{
//    [[CCTouchDispatcher sharedDispatcher]    addTargetedDelegate:self priority:0 swallowsTouches:YES];
//    [super onExit];
//}
//
//- (CGRect)rect
//{
//    CGSize s = [self.texture contentSize];
//    return CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
//}
//
//- (BOOL)containsTouchLocation:(UITouch *)touch
//{
//    return CGRectContainsPoint(self.rect, [self convertTouchToNodeSpaceAR:touch]);
//}

@end
