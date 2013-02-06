//
//  MovableTileSprite.h
//  ragnarok
//
//  Created by Xiao Xiao on 2/6/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MovableTileSprite : CCSprite<CCTargetedTouchDelegate>

@property (nonatomic, assign) int characterId;
@property (nonatomic, assign) int col;
@property (nonatomic, assign) int row;

+ (id)sprite;

@end
