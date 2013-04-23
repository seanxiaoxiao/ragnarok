//
//  Cell.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Cell.h"

@implementation Cell

@synthesize moveCost;
@synthesize row;
@synthesize col;
@synthesize canMove;

- (BOOL)isNextToCol: (int)_col andRow: (int)_row
{
    if (self.col == _col) {
        return self.row == _row + 1 || self.row == _row - 1;
    }
    else if (self.row == _row) {
        return self.col == _col + 1 || self.col == _col - 1;
    }
    return NO;
}

@end
