//
//  Stage.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Stage.h"
#import "cocos2d.h"

@implementation Stage

@synthesize name;

- (CCTMXTiledMap *)stageMap
{
    NSString *stageName = [[NSString stringWithFormat:@"stage%d.tmx", self.stageNo] autorelease];
    return [CCTMXTiledMap tiledMapWithTMXFile:stageName];
};


@end
