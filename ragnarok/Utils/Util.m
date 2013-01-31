//
//  Util.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/31/13.
//
//

#import "Util.h"
#import "StageLayer.h"

@implementation Util


+ (StageLayer *)fetchStageLayer
{
    CCArray *currentLayers = [[CCDirector sharedDirector] runningScene].children;
    for (int i = 0; i < [currentLayers count]; i++) {
        if ([[currentLayers objectAtIndex:i] isKindOfClass:[StageLayer class]]) {
            return [currentLayers objectAtIndex:i];
        }
    }
    return nil;
}

@end
