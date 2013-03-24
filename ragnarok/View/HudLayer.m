//
//  HudLayer.m
//  ragnarok
//
//  Created by Xiao Xiao on 2/13/13.
//
//

#import "HudLayer.h"
#import "cocos2d.h"
#import "Game.h"
#import "Stage.h"

@implementation HudLayer

- (id)init
{
	if( (self = [super initWithColor:ccc4(255, 255, 255, 50)])) {
        self.position = ccp(0, [[CCDirector sharedDirector] winSize].height - 40);
        self.contentSize = CGSizeMake([[CCDirector sharedDirector] winSize].width, 40);

        stageLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:18];
        stageLabel.position = ccp(42, 20);
        stageLabel.anchorPoint = ccp(0, 0.5);
        stageLabel.color = ccc3(0, 0, 0);
        
        [self addChild:stageLabel];
        roundLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:18];
        roundLabel.position = ccp(132, 20);
        roundLabel.anchorPoint = ccp(0, 0.5);
        roundLabel.color = ccc3(0, 0, 0);
        
        [self addChild:roundLabel];
        
        phaseLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:18];
        phaseLabel.position = ccp(222, 20);
        phaseLabel.anchorPoint = ccp(0, 0.5);
        phaseLabel.color = ccc3(0, 0, 0);
        
        [self addChild:phaseLabel];
	}
    return self;
}

- (void)updateStatus:(Game *)game
{
    stageLabel.string = [NSString stringWithFormat:@"Stage: %d", game.stage.stageNo];
    roundLabel.string = [NSString stringWithFormat:@"Round: %d", game.round];
    phaseLabel.string = [NSString stringWithFormat:@"Phase: %d", game.phase];
}

- (void)dealloc
{
	[super dealloc];
}

@end
