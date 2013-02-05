//
//  Stage.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Stage.h"
#import "cocos2d.h"
#import "MapSprite.h"

@implementation Stage

@synthesize name;
@synthesize mapSprite;

- (id)initWithStageNo:(int)stageNo
{
    self = [super init];
    if (self) {
        //characterDirectory = [[NSMutableDictionary alloc] init];
        mapSprite = [MapSprite spriteWithFile:[NSString stringWithFormat:@"stage%d.png", stageNo]];
    }
    return self;
}

@end
