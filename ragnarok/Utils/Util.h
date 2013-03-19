//
//  Util.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/31/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class StageLayer;
@class Character;

@interface Util : NSObject

+ (StageLayer *) fetchStageLayer;

+ (CCMenu *) getMenuByCharacter:(Character *)chraracter;

@end
