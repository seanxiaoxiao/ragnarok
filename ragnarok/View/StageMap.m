//
//  StageMap.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/31/13.
//
//

#import "StageMap.h"
#import "UnitSprites.h"

@implementation StageMap

@synthesize backgroundSprite;

- (id)initWithStageNo:(int)stageNo
{
    self = [super init];
    if (self) {
        backgroundSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"stage%d.png", stageNo]];
    }
    return self;
}

- (void)addCharacter:(int)characterNo inCol:(int)cols andRow:(int)row
{
    
}



@end
