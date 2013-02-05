//
//  StageLayer.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Game.h"

@class Game;
@class CCPanZoomController;


@interface StageLayer : CCLayer<GameDelegate> {
    CCMenu *menu;
    CCPanZoomController *_controller;
    Game *game;
}

+ (CCScene *) scene;

- (void) showMenu;

@end
