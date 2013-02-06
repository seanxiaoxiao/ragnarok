//
//  UnitSprite.h
//  ragnarok
//
//  Created by Xiao Xiao on 2/5/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface UnitSprite : CCSprite<CCTargetedTouchDelegate>

@property (nonatomic, assign) int characterId;

@end
