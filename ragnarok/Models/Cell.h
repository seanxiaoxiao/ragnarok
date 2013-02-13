//
//  Cell.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (nonatomic, assign) int row;
@property (nonatomic, assign) int col;
@property (nonatomic, assign) int moveCost;
@property (nonatomic, assign) BOOL canMove;
@property (nonatomic, assign) BOOL used;

@end
