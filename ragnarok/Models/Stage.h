//
//  Stage.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class CCTMXTiledMap;
@class Character;
@class MapSprite;

@interface Stage : NSObject

@property (nonatomic, retain, readonly) NSString *name;
@property (nonatomic, assign, readonly) int stageNo;
@property (nonatomic, assign, readonly) int rows;
@property (nonatomic, assign, readonly) int cols;
@property (nonatomic, retain, readonly) MapSprite *mapSprite;

- (id)initWithStageNo:(int)stageNo;

@end
