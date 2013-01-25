//
//  StageLayer.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "StageLayer.h"


@implementation StageLayer

@synthesize previousTouch;
@synthesize stageMap;
@synthesize spriteDownStay1;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StageLayer *layer = [StageLayer node];
	   
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
    if((self = [super init])) {
        stageMap = [CCTMXTiledMap tiledMapWithTMXFile:@"stage2.tmx"];
        [self addChild:stageMap];

        self.isTouchEnabled = true;

        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            [stageMap setScale:2.0];
        }
        [self addPlayer];
//        CCTMXLayer *groundLayer = [map layerNamed:@"bg"];

    }
        
    return self;
}

- (void)addPlayer
{
    spriteDownStay1 = [CCSprite spriteWithFile:@"102-1.png" rect:CGRectMake(0, 0, 24, 24)];
    CCSprite *spriteDownStay2 = [CCSprite spriteWithFile:@"102-1.png" rect:CGRectMake(0, 25, 24, 24)];
    
    CCSprite *spriteDownStay3 = [CCSprite spriteWithFile:@"132-1.png" rect:CGRectMake(0, 0, 24, 24)];
    CCSprite *spriteDownStay4 = [CCSprite spriteWithFile:@"132-1.png" rect:CGRectMake(0, 25, 24, 24)];

    
    CCTMXLayer *unitsLayer = [stageMap layerNamed:@"units"];
    
    spriteDownStay1.position = CGPointMake(2 * 24 + 10, 8 * 24 + 12);
    [stageMap addChild:spriteDownStay1 z:[unitsLayer zOrder]];

    spriteDownStay3.position = CGPointMake(2 * 24 + 10, 9 * 24 + 12);
    [stageMap addChild:spriteDownStay3 z:[unitsLayer zOrder]];

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

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint touchLocation = [touch locationInView: [touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];

    if(touchLocation.x < previousTouch.x)
    {
        [self slideMapRight:true];
    }
    else
    {
        [self slideMapRight:false];
    }
    
    if (touchLocation.y < previousTouch.y)
    {
        [self slideMapDown:true];
    }
    else
    {
        [self slideMapDown:false];
    }

    previousTouch = touchLocation;
    
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}


- (void)slideMapRight:(bool)isRight
{
    float posUpdate;
    
    if(isRight)
    {
        posUpdate = 5.0f;
    }
    else
    {
        posUpdate = -5.0f;
    }
    
    CGPoint pos = stageMap.position;
    pos.x -= posUpdate;
    stageMap.position = ccp(pos.x, stageMap.position.y);
}

- (void)slideMapDown:(bool)isDown
{
    float posUpdate;
    
    if(isDown)
    {
        posUpdate = 5.0f;
    }
    else
    {
        posUpdate = -5.0f;
    }
    
    CGPoint pos = stageMap.position;
    pos.y -= posUpdate;
    stageMap.position = ccp(stageMap.position.x, pos.y);
}


@end
