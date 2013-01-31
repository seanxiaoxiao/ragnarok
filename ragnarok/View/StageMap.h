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

@interface StageMap : NSObject

@property (nonatomic, retain, readonly) CCSprite *backgroundSprite;
@property (nonatomic, retain, readonly) NSMutableDictionary *characterDirectory;

- (id)initWithStageNo:(int)stageNo;

- (void)addCharacter:(int)characterNo inCol:(int)cols andRow:(int)row;

@end
