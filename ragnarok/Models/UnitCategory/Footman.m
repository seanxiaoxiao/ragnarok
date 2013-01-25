//
//  Footman.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Footman.h"

@implementation Footman
@synthesize moves;
@synthesize name;

- (id) init
{
    self = [super init];
    if (self)
    {
        name = @"Footman";
        moves = 4;
    }
    return self;
}

@end
