//
//  Character.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import <Foundation/Foundation.h>

@class UnitSprite;
@class UnitCategory;

enum Direction {
    UP = 0,
    DOWN = 1,
    LEFT = 2,
    RIGHT = 3
};

enum CharacterStatus {
    READY = 0,
    ACTIVE = 1,
    MOVED = 2,
    ACTION = 3,
    DONE = 4,
};


@interface Character : NSObject

@property (nonatomic, retain, readonly) NSString *name;
@property (nonatomic, assign) int characterId;

@property (nonatomic, assign) int row;
@property (nonatomic, assign) int col;
@property (nonatomic, assign) BOOL roundFinish;
@property (nonatomic, assign, readonly) enum CharacterStatus status;

@property (nonatomic, retain, readonly) UnitCategory *unitCategory;
@property (nonatomic, assign, readonly) int unitNo;
@property (nonatomic, retain, readonly) UnitSprite *unitMoveSprite1;
@property (nonatomic, retain, readonly) UnitSprite *unitMoveSprite2;
@property (nonatomic, retain, readonly) NSMutableArray *movableTiles;

@property (nonatomic, assign, readonly) int level;
@property (nonatomic, assign, readonly) int exp;
@property (nonatomic, assign, readonly) int healthPoint;
@property (nonatomic, assign, readonly) int maxHealthPoint;
@property (nonatomic, assign, readonly) int strength;
@property (nonatomic, assign, readonly) int skill;
@property (nonatomic, assign, readonly) int speed;
@property (nonatomic, assign, readonly) int luck;
@property (nonatomic, assign, readonly) int defence;

- (id)initWithUnitNo:(int) _unitNo;

- (void)levelUp;

- (void)attack:(Character *)opponent;

- (void)speak:(NSString *)text;

- (void)faceTo:(enum Direction) direction;

- (void)finishRound;

- (void)startRound;

- (void)move;

- (void)setPosition: (int)_col andRow:(int)_row;

- (void)setCharacterId:(int)characterId;

- (void)touched;

- (void)doneMove;

- (void)deactivate;

- (BOOL)activated;

@end
