//
//  CharacterInfoLayer.h
//  ragnarok
//
//  Created by Xiao Xiao on 2/13/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class Character;

@interface CharacterInfoLayer : CCLayerColor {
    CCSprite *faceSprite;
    CCLabelTTF *nameLabel;
    CCLabelTTF *levelLabel;
    CCLabelTTF *expLabel;
    CCLabelTTF *healthPointLabel;
    CCLabelTTF *strengthLabel;
    CCLabelTTF *skillLabel;
    CCLabelTTF *speedLabel;
    CCLabelTTF *luckLabel;
    CCLabelTTF *defenceLabel;
}

- (id)initWithCharacter:(Character *)character;

@end
