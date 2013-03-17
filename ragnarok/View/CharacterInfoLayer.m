//
//  CharacterInfoLayer.m
//  ragnarok
//
//  Created by Xiao Xiao on 2/13/13.
//
//

#import "CharacterInfoLayer.h"
#import "cocos2d.h"
#import "Character.h"

@implementation CharacterInfoLayer

- (id)initWithCharacter:(Character *)character
{
    if( (self = [super initWithColor:ccc4(255, 255, 255, 170)])) {
        self.position = ccp(0, [[CCDirector sharedDirector] winSize].height - 40);
        self.contentSize = CGSizeMake([[CCDirector sharedDirector] winSize].width / 3, [[CCDirector sharedDirector] winSize].height / 3);
        
        faceSprite = [CCSprite spriteWithFile:@"92.png"];
        
        nameLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Name: %@", character.name] fontName:@"Marker Felt" fontSize:18];
        nameLabel.position = ccp(42, 20);
        nameLabel.anchorPoint = ccp(0, 0.5);
        nameLabel.color = ccc3(0, 0, 0);

        levelLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Level: %d", character.level] fontName:@"Marker Felt" fontSize:18];
        levelLabel.position = ccp(42, 20);
        levelLabel.anchorPoint = ccp(0, 0.5);
        levelLabel.color = ccc3(0, 0, 0);

        expLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Exp: %d", character.exp] fontName:@"Marker Felt" fontSize:18];
        expLabel.position = ccp(42, 20);
        expLabel.anchorPoint = ccp(0, 0.5);
        expLabel.color = ccc3(0, 0, 0);
        
        healthPointLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"HP: %d/%d", character.healthPoint, character.maxHealthPoint] fontName:@"Marker Felt" fontSize:18];
        healthPointLabel.position = ccp(42, 20);
        healthPointLabel.anchorPoint = ccp(0, 0.5);
        healthPointLabel.color = ccc3(0, 0, 0);

        strengthLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Strength: %d", character.strength] fontName:@"Marker Felt" fontSize:18];
        strengthLabel.position = ccp(42, 20);
        strengthLabel.anchorPoint = ccp(0, 0.5);
        strengthLabel.color = ccc3(0, 0, 0);

        skillLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Strength: %d", character.skill] fontName:@"Marker Felt" fontSize:18];
        skillLabel.position = ccp(42, 20);
        skillLabel.anchorPoint = ccp(0, 0.5);
        skillLabel.color = ccc3(0, 0, 0);
        
        speedLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Skill: %d", character.speed] fontName:@"Marker Felt" fontSize:18];
        speedLabel.position = ccp(42, 20);
        speedLabel.anchorPoint = ccp(0, 0.5);
        speedLabel.color = ccc3(0, 0, 0);

        luckLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Luck: %d", character.luck] fontName:@"Marker Felt" fontSize:18];
        luckLabel.position = ccp(42, 20);
        luckLabel.anchorPoint = ccp(0, 0.5);
        luckLabel.color = ccc3(0, 0, 0);

        defenceLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Defence: %d", character.defence] fontName:@"Marker Felt" fontSize:18];
        defenceLabel.position = ccp(42, 20);
        defenceLabel.anchorPoint = ccp(0, 0.5);
        defenceLabel.color = ccc3(0, 0, 0);
        
        [self addChild:faceSprite];
        [self addChild:nameLabel];
        [self addChild:levelLabel];
        [self addChild:expLabel];
        [self addChild:strengthLabel];
        [self addChild:skillLabel];
        [self addChild:speedLabel];
        [self addChild:luckLabel];
        [self addChild:defenceLabel];
	}
    return self;
}

- (void)dealloc
{
	[super dealloc];
}
@end
