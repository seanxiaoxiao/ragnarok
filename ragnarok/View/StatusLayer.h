//
//  StatusLayer.h
//  ragnarok
//
//  Created by Xiao Xiao on 3/17/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Character.h"

@interface StatusLayer : CCLayerColor {
    CCLabelTTF *idLabel;
    CCLabelTTF *levelLabel;
    CCLabelTTF *expLabel;
    CCLabelTTF *strLabel;
    CCLabelTTF *defLabel;
    CCLabelTTF *speedLabel;
    CCLabelTTF *skillLabel;
    CCLabelTTF *luckLabel;
}


- (id)initWithCharacter:(Character *)character;

@end
