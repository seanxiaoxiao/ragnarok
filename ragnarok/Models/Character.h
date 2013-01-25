//
//  Character.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import <Foundation/Foundation.h>

enum Direction {
    UP = 0,
    DOWN = 1,
    LEFT = 2,
    RIGHT = 3
};


@interface Character : NSObject

@property (nonatomic, retain, readonly) NSString *name;
@property (nonatomic, assign) int characterId;
@property (nonatomic, assign) int level;
@property (nonatomic, assign) int experience;
@property (nonatomic, assign) int rowAt;
@property (nonatomic, assign) int colAt;

- (void) levelUp;

- (void) attack:(Character *)opponent;

- (void) speak:(NSString *)text;

- (void) faceTo:(enum Direction) direction;

- (void) move;

@end
