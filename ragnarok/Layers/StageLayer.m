//
//  StageLayer.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "StageLayer.h"
#import "CCPanZoomController.h"
#import "StageMap.h"


@implementation StageLayer

@synthesize previousTouch;
@synthesize spriteDownStay1;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StageLayer *layer = [StageLayer node];
	   
    [scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
    if((self = [super init])) {
        StageMap *stageMap = [[StageMap alloc] initWithStageNo:42];
        stageMap.backgroundSprite.anchorPoint = ccp(0, 0);
        [self addChild: stageMap.backgroundSprite z:0];
        
        _controller = [[CCPanZoomController controllerWithNode:self] retain];
        _controller.boundingRect = [stageMap.backgroundSprite boundingBox];
        _controller.zoomOutLimit = _controller.optimalZoomOutLimit;
        _controller.zoomInLimit = 2.0f;
        [_controller enableWithTouchPriority:0 swallowsTouches:NO];
        
        stageMap.backgroundSprite.scale = _controller.optimalZoomOutLimit;
        
        self.isTouchEnabled = true;
    }
        
    return self;
}

- (void)addPlayer
{
    spriteDownStay1 = [CCSprite spriteWithFile:@"102-1.png" rect:CGRectMake(0, 0, 24, 24)];
    CCSprite *spriteDownStay2 = [CCSprite spriteWithFile:@"102-1.png" rect:CGRectMake(0, 25, 24, 24)];
    
    CCSprite *spriteDownStay3 = [CCSprite spriteWithFile:@"132-1.png" rect:CGRectMake(0, 0, 24, 24)];
    CCSprite *spriteDownStay4 = [CCSprite spriteWithFile:@"132-1.png" rect:CGRectMake(0, 25, 24, 24)];

    
//    CCTMXLayer *unitsLayer = [stageMap layerNamed:@"units"];
//    
//    spriteDownStay1.position = CGPointMake(2 * 24 + 10, 8 * 24 + 12);
//    [stageMap addChild:spriteDownStay1 z:[unitsLayer zOrder]];
//
//    spriteDownStay3.position = CGPointMake(2 * 24 + 10, 9 * 24 + 12);
//    [stageMap addChild:spriteDownStay3 z:[unitsLayer zOrder]];

    CCAnimation* animation;
    
    NSMutableArray *animFrames = [NSMutableArray array];
    
    [animFrames addObject:spriteDownStay1.displayFrame];
    [animFrames addObject:spriteDownStay2.displayFrame];

    
    animation = [CCAnimation animationWithSpriteFrames:animFrames];
    
    animation.delayPerUnit = 0.5f;
    animation.restoreOriginalFrame = NO;
    
    
    CCAnimate *AnimAction  = [CCAnimate actionWithAnimation:animation];
    
    CCRepeatForever *anim = [CCRepeatForever actionWithAction:AnimAction];
    
    [spriteDownStay1 runAction:anim];
    
    CCAnimation* animation2;
    
    NSMutableArray *animFrames2 = [NSMutableArray array];
    
    [animFrames2 addObject:spriteDownStay3.displayFrame];
    [animFrames2 addObject:spriteDownStay4.displayFrame];
    
    
    animation2 = [CCAnimation animationWithSpriteFrames:animFrames2];
    
    animation2.delayPerUnit = 0.5f;
    animation2.restoreOriginalFrame = NO;
    
    
    CCAnimate *AnimAction2  = [CCAnimate actionWithAnimation:animation2];
    
    CCRepeatForever *anim2 = [CCRepeatForever actionWithAction:AnimAction2];
    
    [spriteDownStay3 runAction:anim2];
    
    CCMoveTo *move = [CCMoveTo actionWithDuration:100 position:ccp(20,300)];
    CCCallFuncN *move_done = [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished)];
    [spriteDownStay1 runAction:[CCSequence actions:move, move_done,nil]];
    
}

-(void)spriteMoveFinished
{
    CCMoveTo *move1 = [CCMoveTo actionWithDuration:1 position:ccp(20,0)];
    
    [spriteDownStay1 runAction:[CCSequence actions:move1,nil]];
}


#pragma mark TouchesMethod
- (void) showMenu
{
    if (menu != nil) {
        return;
    }
    CGSize size = [[CCDirector sharedDirector] winSize];
    [CCMenuItemFont setFontSize:28];
    
    CCMenuItem *exitStage = [CCMenuItemFont itemWithString:@"Exit Stage" block:^(id sender) {
        [[CCDirector sharedDirector] popScene];
    }];

    CCMenuItem *endTurn = [CCMenuItemFont itemWithString:@"End Turn" block:^(id sender) {
    }];
    
    CCMenuItem *closeMenu = [CCMenuItemFont itemWithString:@"Close Menu" block:^(id sender) {
        if (menu != nil) {
            [self removeChild:menu cleanup:YES];
            menu = nil;
        }
    }];

    menu = [[CCMenu menuWithItems:exitStage, endTurn, closeMenu, nil] autorelease];
    
    [menu alignItemsVertically];
    [menu setPosition:ccp( size.width / 3, size.height / 3 - 50)];
    
    [self addChild:menu];
    
}

- (CGPoint)convertTouchToNodeSpace:(UITouch *)touch
{
    CGPoint point = [touch locationInView: [touch view]];
    point = [[CCDirector sharedDirector] convertToGL: point];
    return [self convertToNodeSpace:point];
}

- (void) closeMenu
{
    
}


@end
