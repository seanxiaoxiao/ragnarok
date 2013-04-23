//
//  DefaultCondition.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import "DefaultCondition.h"
#import "Character.h"
#import "Action.h"


@implementation DefaultCondition

- (BOOL) match:(NSArray *)reachableCharacters
{
    return YES;
}

- (void) doAction:(NSArray *)reachableCharacters
{
    [self.action doActionTo:nil];
}

@end
