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

@interface Stage : NSObject

@property (nonatomic, retain, readonly) NSString *name;
@property (nonatomic, assign, readonly) int stageNo;
@property (nonatomic, assign, readonly) int rows;
@property (nonatomic, assign, readonly) int cols;

- (CCTMXTiledMap *)stageMap;

@end
