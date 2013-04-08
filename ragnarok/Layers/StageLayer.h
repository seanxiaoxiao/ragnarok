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
@class HudLayer;
@class StatusLayer;
@class CCPanZoomController;
@class MessageLayer;
@class DialogBox;

@interface StageLayer : CCLayer<GameDelegate> {
    CCMenu *menu;
    CCPanZoomController *_controller;
    Game *game;
    HudLayer *hud;
    MessageLayer *messageLayer;
    StatusLayer *statusLayer;
    DialogBox *dialogBox;
    CCMenu *actionMenu;
}

@property (nonatomic, retain) HudLayer *hud;
@property (nonatomic, retain) DialogBox *dialogBox;
@property (nonatomic, retain) MessageLayer *messageLayer;

+ (CCScene *) scene;

- (void) showMenu;

@end
