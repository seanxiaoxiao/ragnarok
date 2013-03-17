//
//  StatusLayer.m
//  ragnarok
//
//  Created by Xiao Xiao on 3/17/13.
//
//

#import "StatusLayer.h"

@implementation StatusLayer

- (id)initWithCharacter:(Character *)character
{
	if( (self = [super initWithColor:ccc4(255, 255, 255, 50)])) {
        self.position = ccp([[CCDirector sharedDirector] winSize].width / 2, [[CCDirector sharedDirector] winSize].height / 2);
        self.contentSize = CGSizeMake([[CCDirector sharedDirector] winSize].width / 3, 240);
        
        idLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:14];
        idLabel.position = ccp(42, 20);
        idLabel.anchorPoint = ccp(0, 0.5);
        idLabel.color = ccc3(0, 0, 0);
        idLabel.string = [NSString stringWithFormat:@"Id: %d", character.unitNo];
        [self addChild:idLabel];
        
        levelLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:14];
        levelLabel.position = ccp(42, 40);
        levelLabel.anchorPoint = ccp(0, 0.5);
        levelLabel.color = ccc3(0, 0, 0);
        levelLabel.string = [NSString stringWithFormat:@"Level: %d", character.level];
        [self addChild:levelLabel];

        expLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:14];
        expLabel.position = ccp(42, 60);
        expLabel.anchorPoint = ccp(0, 0.5);
        expLabel.color = ccc3(0, 0, 0);
        expLabel.string = [NSString stringWithFormat:@"EXP: %d", character.exp];
        [self addChild:expLabel];

        strLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:14];
        strLabel.position = ccp(42, 80);
        strLabel.anchorPoint = ccp(0, 0.5);
        strLabel.color = ccc3(0, 0, 0);
        strLabel.string = [NSString stringWithFormat:@"Strength: %d", character.strength];
        [self addChild:strLabel];
        
        defLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:14];
        defLabel.position = ccp(42, 100);
        defLabel.anchorPoint = ccp(0, 0.5);
        defLabel.color = ccc3(0, 0, 0);
        defLabel.string = [NSString stringWithFormat:@"Defense: %d", character.defence];
        [self addChild:defLabel];
        
        speedLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:14];
        speedLabel.position = ccp(42, 120);
        speedLabel.anchorPoint = ccp(0, 0.5);
        speedLabel.color = ccc3(0, 0, 0);
        speedLabel.string = [NSString stringWithFormat:@"Speed: %d", character.speed];
        [self addChild:speedLabel];

        skillLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:14];
        skillLabel.position = ccp(42, 140);
        skillLabel.anchorPoint = ccp(0, 0.5);
        skillLabel.color = ccc3(0, 0, 0);
        skillLabel.string = [NSString stringWithFormat:@"Skill: %d", character.skill];
        [self addChild:skillLabel];
        
        luckLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:14];
        luckLabel.position = ccp(42, 160);
        luckLabel.anchorPoint = ccp(0, 0.5);
        luckLabel.color = ccc3(0, 0, 0);
        luckLabel.string = [NSString stringWithFormat:@"Luck: %d", character.luck];
        [self addChild:luckLabel];
        
	}
    return self;
}

- (void)dealloc
{
	[super dealloc];
}


@end
