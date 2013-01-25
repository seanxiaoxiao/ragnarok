//
//  StageLayer.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface StageLayer : CCLayer {

}

@property (nonatomic, assign) CGPoint previousTouch;
@property (nonatomic, retain) CCTMXTiledMap *stageMap;
@property (nonatomic, retain) CCSprite *spriteDownStay1;

+(CCScene *) scene;

@end
