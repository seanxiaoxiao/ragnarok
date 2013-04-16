//
//  DefaultCondition.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import "DefaultCondition.h"
#import "Game.h"

@implementation DefaultCondition

- (BOOL) match:(NSArray *)reachableCharacters
{
    return YES;
}

- (Character *) select:(NSArray *)reachableCharacters
{
    if ([[Game sharedGame].homeCharacters count] > 0) {
        return [[Game sharedGame].homeCharacters objectAtIndex:0];
    }
    return nil;
}

@end
