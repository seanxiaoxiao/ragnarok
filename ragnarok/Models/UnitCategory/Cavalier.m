//
//  Cavalier.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Cavalier.h"

@implementation Cavalier
@synthesize moves;
@synthesize name;

- (id) init
{
    self = [super init];
    if (self)
    {
        name = @"Cavalier";
        moves = 6;
    }
    return self;
}

@end
