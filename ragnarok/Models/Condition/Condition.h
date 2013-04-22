//
//  Condition.h
//  ragnarok
//
//  Created by Xiao Xiao on 4/15/13.
//
//

#import <Foundation/Foundation.h>

@class Character;
@class Action;
@interface Condition : NSObject

@property (nonatomic, assign) Action* action;

- (BOOL) match:(NSArray *)reachableCharacters;

- (void) doAction:(NSArray *)reachableCharacters;


@end
