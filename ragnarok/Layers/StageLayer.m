//
//  StageLayer.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "StageLayer.h"
#import "CCPanZoomController.h"
#import "Game.h"
#import "Character.h"
#import "UnitSprite.h"


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
        game = [[Game alloc] initGameWithStageNo:42];
        game.delegate = self;
        [game loadMap];

        self.isTouchEnabled = true;
        [self addPlayer];
    }
        
    return self;
}

- (void)addPlayer
{
}

- (void)addMovableTileAtCol:(int)col andRow:(int)row
{
    CCSprite *movableTile = [CCSprite spriteWithFile:@"movabletile.png" rect:CGRectMake(0, 0, 24, 24)];
    [movableTile setScale:_controller.optimalZoomOutLimit];
    movableTile.position = CGPointMake(((col * 24) + 12) * _controller.optimalZoomOutLimit, ((row * 24) + 12) * _controller.optimalZoomOutLimit);
    [self addChild:movableTile z:50];
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

- (void)addCharacter:(Character *)character atCol:(int)col andRow:(int)row
{
    [character.unitMoveSprite1 setScale:_controller.optimalZoomOutLimit];
    character.unitMoveSprite1.position = CGPointMake(((col * 24) + 12) * _controller.optimalZoomOutLimit, ((row * 24) + 12) * _controller.optimalZoomOutLimit);
    
    [character.unitMoveSprite2 setScale:_controller.optimalZoomOutLimit];

    [self addChild:character.unitMoveSprite1 z:100];
    
    CCAnimation* animation;
    NSMutableArray *animFrames = [NSMutableArray array];
    [animFrames addObject:character.unitMoveSprite1.displayFrame];
    [animFrames addObject:character.unitMoveSprite2.displayFrame];
    animation = [CCAnimation animationWithSpriteFrames:animFrames];
    animation.delayPerUnit = 0.5f;
    animation.restoreOriginalFrame = NO;
    
    CCAnimate *animAction  = [CCAnimate actionWithAnimation:animation];
    CCRepeatForever *anim = [CCRepeatForever actionWithAction:animAction];
    [character.unitMoveSprite1 runAction:anim];
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

#pragma Touch Handling



@end
