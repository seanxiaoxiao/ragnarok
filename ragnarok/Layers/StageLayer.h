//
//  StageLayer.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "StageMap.h"

@class StageMap;
@class CCPanZoomController;


@interface StageLayer : CCLayer<StageMapDelegate> {
    CCMenu *menu;
    CCPanZoomController *_controller;
    StageMap *stageMap;
}

+ (CCScene *) scene;

- (void) showMenu;

@end
