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
    status = READY;
}

- (BOOL)activated
{
    return status == ACTIVE;
}

#pragma private
- (void)_dismissMovableTiles
{
    for (MovableTileSprite *movableTile in movableTiles) {
        [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:movableTile];
        [movableTile removeFromParentAndCleanup:YES];
    }
    [movableTiles removeAllObjects];
}

@end
