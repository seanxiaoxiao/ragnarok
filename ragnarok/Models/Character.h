//
//  Character.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import <Foundation/Foundation.h>

@class UnitSprite;

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
@property (nonatomic, assign) int row;
@property (nonatomic, assign) int col;
@property (nonatomic, assign) BOOL roundFinish;

@property (nonatomic, assign, readonly) int unitNo;
@property (nonatomic, retain, readonly) UnitSprite *unitMoveSprite1;
@property (nonatomic, retain, readonly) UnitSprite *unitMoveSprite2;

- (id)initWithUnitNo:(int) _unitNo;

- (void) levelUp;

- (void) attack:(Character *)opponent;

- (void) speak:(NSString *)text;

- (void) faceTo:(enum Direction) direction;

- (void) finishRound;

- (void) startRound;

- (void) move;

- (void) setPosition: (int)_col andRow:(int)_row;

- (void) setCharacterId:(int)characterId;

@end
