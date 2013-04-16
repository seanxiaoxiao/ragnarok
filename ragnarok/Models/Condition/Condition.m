//
//  Condition.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import "Condition.h"
#import "Action.h"
#import "Character.h"

@implementation Condition
@synthesize action;

- (void) doAction:(NSArray *)reachableCharacters
{
    Character *selectedOne = [self select:reachableCharacters];
    if (selectedOne) {
        [action doActionToCol:selectedOne.col AndRow:selectedOne.row];
    }
}



@end
