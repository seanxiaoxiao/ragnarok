//
//  Character.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Character.h"
#import "cocos2d.h"
#import "UnitSprite.h"
#import "MovableTileSprite.h"
#import "AttackableTileSprite.h"
#import "Footman.h"
#import "UnitCategory.h"
#import "Game.h"
#import "Stage.h"
#import "Cell.h"

@implementation Character
@synthesize roundFinish;
@synthesize unitMoveSprite1;
@synthesize unitMoveSprite2;
@synthesize unitNo;
@synthesize col;
@synthesize row;
@synthesize status;
@synthesize movableTiles;
@synthesize unitCategory;
@synthesize attackableTiles;


- (void)finishRound
{
    status = READY;
}

- (void)startRound
{
    roundFinish = false;
}

- (id)initWithUnitNo:(int) _unitNo
{
    self = [super init];
    if (self) {
        unitNo = _unitNo;
        unitMoveSprite1 = [UnitSprite spriteWithFile:[NSString stringWithFormat:@"move-%d.png", unitNo] rect:CGRectMake(0, 0, 24, 24)];
        unitMoveSprite2 = [UnitSprite spriteWithFile:[NSString stringWithFormat:@"move-%d.png", unitNo] rect:CGRectMake(0, 25, 24, 24)];
        movableTiles = [[NSMutableArray alloc] init];
        attackableTiles = [[NSMutableArray alloc] init];
        status = READY;
        unitCategory = [[Footman alloc] init];
    }
    return self;
}

- (void)setPosition: (int)_col andRow:(int)_row
{
    col = _col;
    row = _row;
}

- (void)setCharacterId:(int)characterId
{
    _characterId = characterId;
    unitMoveSprite1.characterId = characterId;
    unitMoveSprite2.characterId = characterId;
}

- (void)touched
{
    if (status == READY) {
        [self activate];
    }
    else if (status == ACTIVE) {
        [self deactivate];
    }
}

- (void)activate
{
    NSMutableArray *movableCells = [[Game sharedGame].stage movableTiles:self];
    for (Cell *cell in movableCells) {
        MovableTileSprite *movableTile = [MovableTileSprite sprite];
        movableTile.characterId = self.characterId;
        movableTile.col = cell.col;
        movableTile.row = cell.row;
        [movableTiles addObject:movableTile];
    }
    [movableCells release];
    status = ACTIVE;
}

- (void)deactivate
{
    if (status == ACTIVE) {
        [self _dismissMovableTiles];
        status = READY;
    }
}

- (void)doneMove
{
    [self _dismissMovableTiles];
    status = ACTION;
}

- (void)attack:(Character *)opponent
{
    [self _dismissAttackableTiles];
    int damage = self.strength - opponent.defence;
    opponent.healthPoint = opponent.healthPoint - damage;
    if (opponent.healthPoint <= 0) {
        [opponent die];
    }
    status = DONE;
}

- (void)die
{
    status = DEAD;
    [[Game sharedGame] characterDie:self];
}

- (void)doneAction
{
    status = DONE;
}

- (BOOL)activated
{
    return status == ACTIVE;
}

- (void)readyToAttack
{
    NSMutableArray *attackableCells = [[Game sharedGame].stage attackableTiles:self];
    for (Cell *cell in attackableCells) {
        AttackableTileSprite *attackableTile = [AttackableTileSprite sprite];
        attackableTile.characterId = self.characterId;
        attackableTile.col = cell.col;
        attackableTile.row = cell.row;
        [attackableTiles addObject:attackableTile];
    }
    [attackableCells release];
}

#pragma private
- (void)_dismissAttackableTiles
{
    for (AttackableTileSprite *attackableTile in attackableTiles) {
        [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:attackableTile];
        [attackableTile removeFromParentAndCleanup:YES];
    }
    [attackableTiles removeAllObjects];
}

- (void)_dismissMovableTiles
{
    for (MovableTileSprite *movableTile in movableTiles) {
        [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:movableTile];
        [movableTile removeFromParentAndCleanup:YES];
    }
    [movableTiles removeAllObjects];
}

@end
