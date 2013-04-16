//
//  EnemyCharacter.h
//  ragnarok
//
//  Created by Xiao Xiao on 4/1/13.
//
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Condition.h"

@interface EnemyCharacter : Character

@property (atomic, retain) NSArray *conditions;

- (void) moveToCol: (int)col andRow: (int)row;



@end
