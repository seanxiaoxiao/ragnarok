//
//  StageMap.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/31/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Character.h"

@class UnitSprites;

@protocol StageMapDelegate <NSObject>

- (void)addMapBackground:(CCSprite *)backgroundSprite;

- (void)addCharacter:(UnitSprites *)unit atCol:(int)col andRow:(int)row;

@end

@interface StageMap : NSObject {
    NSMutableDictionary *characterDirectory;
}

@property (nonatomic, retain, readonly) CCSprite *backgroundSprite;
@property (nonatomic, retain) id<StageMapDelegate> delegate;

- (id)initWithStageNo:(int)stageNo;

- (void)loadMap;

- (void)addCharacter:(int)characterNo atCol:(int)cols andRow:(int)row;

@end
