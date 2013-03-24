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
@class CCRepeatForever;

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
    DEAD = 5,
};


@interface Character : NSObject

@property (nonatomic, retain, readonly) NSString *name;
@property (nonatomic, assign) int characterId;

@property (nonatomic, assign, readonly) int row;
@property (nonatomic, assign, readonly) int col;
@property (nonatomic, assign, readonly) int tempCol;
@property (nonatomic, assign, readonly) int tempRow;
@property (nonatomic, assign) BOOL roundFinish;
@property (nonatomic, assign) BOOL isEnemy;
@property (nonatomic, assign, readonly) enum CharacterStatus status;

@property (nonatomic, retain, readonly) UnitCategory *unitCategory;
@property (nonatomic, assign, readonly) int unitNo;
@property (nonatomic, retain, readonly) UnitSprite *unitMoveSprite1;
@property (nonatomic, retain, readonly) UnitSprite *unitMoveSprite2;
@property (nonatomic, retain) CCRepeatForever *movingAnimation;

@property (nonatomic, retain, readonly) NSMutableArray *movableTiles;
@property (nonatomic, retain, readonly) NSMutableArray *attackableTiles;

@property (nonatomic, assign) int level;
@property (nonatomic, assign) int exp;
@property (nonatomic, assign) int healthPoint;
@property (nonatomic, assign) int maxHealthPoint;
@property (nonatomic, assign) int strength;
@property (nonatomic, assign) int skill;
@property (nonatomic, assign) int speed;
@property (nonatomic, assign) int luck;
@property (nonatomic, assign) int defence;

- (id)initWithUnitNo:(int) _unitNo;

- (void)levelUp;

- (void)attack:(Character *)opponent;

- (void)speak:(NSString *)text;

- (void)ready;

- (void)prepareToMove;

- (void)setPosition: (int)_col andRow:(int)_row;

- (void)setCharacterId:(int)characterId;

- (void)touched;

- (void)doneMove;

- (void)doneAction;

- (void)readyToAttack;

- (void)deactivate;

- (BOOL)activated;

- (void)cancelAction;

- (BOOL)canAttack:(Character *)attackee;

@end
