//
//  CharacterNearest.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import "CharacterNearest.h"

@implementation CharacterNearest
@synthesize action;

- (BOOL) match:(NSArray *)reachableCharacters
{
    return [reachableCharacters count] > 0;
}

- (Character *) select:(NSArray *)reachableCharacters
{
    return nil;
}



@end
