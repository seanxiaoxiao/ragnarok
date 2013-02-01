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
#import "UnitSprites.h"


@implementation StageLayer

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
        stageMap = [[StageMap alloc] initWithStageNo:42];
        stageMap.delegate = self;
        [stageMap loadMap];

        self.isTouchEnabled = true;
        [self addPlayer];
    }
        
    return self;
}

- (void)addPlayer
{
    [stageMap addCharacter:102 atCol:1 andRow:1];
}

- (void)addMapBackground:(CCSprite *)backgroundSprite
{
    backgroundSprite.anchorPoint = ccp(0, 0);
    
    [self addChild:backgroundSprite z:0];
    
    _controller = [[CCPanZoomController controllerWithNode:self] retain];
    _controller.boundingRect = [backgroundSprite boundingBox];
    _controller.zoomOutLimit = _controller.optimalZoomOutLimit;
    _controller.zoomInLimit = 2.0f;
    [_controller enableWithTouchPriority:0 swallowsTouches:NO];
    
    backgroundSprite.scale = _controller.optimalZoomOutLimit;
}

- (void)addCharacter:(UnitSprites *)unit atCol:(int)col andRow:(int)row
{
    [unit.unitMoveSprite1 setScale:_controller.optimalZoomOutLimit];
    unit.unitMoveSprite1.position = CGPointMake(((col * 24) + 12) * _controller.optimalZoomOutLimit, ((row * 24) + 12) * _controller.optimalZoomOutLimit);
    
    [unit.unitMoveSprite2 setScale:_controller.optimalZoomOutLimit];

    [self addChild:unit.unitMoveSprite1 z:1];
    
    CCAnimation* animation;
    NSMutableArray *animFrames = [NSMutableArray array];
    [animFrames addObject:unit.unitMoveSprite1.displayFrame];
    [animFrames addObject:unit.unitMoveSprite2.displayFrame];
    animation = [CCAnimation animationWithSpriteFrames:animFrames];
    animation.delayPerUnit = 0.5f;
    animation.restoreOriginalFrame = NO;
    
    CCAnimate *animAction  = [CCAnimate actionWithAnimation:animation];
    CCRepeatForever *anim = [CCRepeatForever actionWithAction:animAction];
    [unit.unitMoveSprite1 runAction:anim];


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
