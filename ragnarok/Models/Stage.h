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
@class Cell;

@interface Stage : NSObject {
    Cell*** cells;
}

@property (nonatomic, retain, readonly) NSString *name;
@property (nonatomic, assign, readonly) int stageNo;
@property (nonatomic, assign, readonly) int width;
@property (nonatomic, assign, readonly) int height;
@property (nonatomic, retain, readonly) MapSprite *mapSprite;

- (id)initWithStageNo:(int)stageNo;

- (Cell *)getCellAtCol: (int)col andRow:(int)row;

- (NSMutableArray *)movableTiles:(Character *)character;

@end
