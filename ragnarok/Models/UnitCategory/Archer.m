//
//  Archer.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Archer.h"

@implementation Archer
@synthesize moves;
@synthesize name;

- (id) init
{
    self = [super init];
    if (self)
    {
        name = @"Archer";
        moves = 4;
    }
    return self;
}

@end
