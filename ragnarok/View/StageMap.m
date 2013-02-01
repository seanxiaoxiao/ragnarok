//
//  StageMap.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/31/13.
//
//

#import "StageMap.h"
#import "UnitSprites.h"
#import "StageLayer.h"
#import "Util.h"

@implementation StageMap

@synthesize backgroundSprite;
@synthesize delegate;

- (id)initWithStageNo:(int)stageNo
{
    self = [super init];
    if (self) {
        characterDirectory = [[NSMutableDictionary alloc] init];
        backgroundSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"stage%d.png", stageNo]];
    
    }
    return self;
}

- (void)loadMap
{
    [delegate addMapBackground:backgroundSprite];
}

- (void)addCharacter:(int)characterNo atCol:(int)col andRow:(int)row
{
    UnitSprites *newCharacter = [[UnitSprites alloc] initWithUnitNo:characterNo];
    [characterDirectory setObject:newCharacter forKey:[NSNumber numberWithInt:characterNo]];
    [delegate addCharacter:newCharacter atCol:col andRow:row];
}



@end
