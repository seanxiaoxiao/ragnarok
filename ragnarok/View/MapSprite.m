//
//  MapSprite.m
//  ragnarok
//
//  Created by Xiao Xiao on 2/5/13.
//
//

#import "MapSprite.h"
#import "cocos2d.h"

@implementation MapSprite

+(id)spriteWithFile:(NSString*)filename
{
	return [[[super alloc] initWithFile:filename] autorelease];
}

@end
