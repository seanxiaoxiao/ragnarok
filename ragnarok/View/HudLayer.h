//
//  HudLayer.h
//  ragnarok
//
//  Created by Xiao Xiao on 2/13/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CCLabelTTF;
@class Game;

@interface HudLayer : CCLayerColor {
    CCLabelTTF *stageLabel;
    CCLabelTTF *roundLabel;
}

- (void)updateStatus:(Game *)game;

@end
