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


- (void) finishRound {
    status = READY;
}

- (void) startRound {
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

- (void) setPosition: (int)_col andRow:(int)_row
{
    col = _col;
    row = _row;
}

- (void) setCharacterId:(int)characterId
{
    _characterId = characterId;
    unitMoveSprite1.characterId = characterId;
    unitMoveSprite2.characterId = characterId;
}

- (void) touched
{
    if (status == READY) {
        MovableTileSprite *tile1 = [MovableTileSprite sprite];
        tile1.characterId = self.characterId;
        tile1.col = self.col - 1;
        tile1.row = self.row;
        [self.movableTiles addObject:tile1];
        MovableTileSprite *tile2 = [MovableTileSprite sprite];
        tile2.characterId = self.characterId;
        tile2.col = self.col + 1;
        tile2.row = self.row;
        [self.movableTiles addObject:tile2];
        MovableTileSprite *tile3 = [MovableTileSprite sprite];
        tile3.characterId = self.characterId;
        tile3.col = self.col;
        tile3.row = self.row - 1;
        [self.movableTiles addObject:tile3];
        MovableTileSprite *tile4 = [MovableTileSprite sprite];
        tile4.characterId = self.characterId;
        tile4.col = self.col;
        tile4.row = self.row + 1;
        [self.movableTiles addObject:tile4];
        
        MovableTileSprite *tile5 = [MovableTileSprite sprite];
        tile5.characterId = self.characterId;
        tile5.col = self.col - 1;
        tile5.row = self.row - 1;
        [self.movableTiles addObject:tile5];
        MovableTileSprite *tile6 = [MovableTileSprite sprite];
        tile6.characterId = self.characterId;
        tile6.col = self.col - 2;
        tile6.row = self.row;
        [self.movableTiles addObject:tile6];
        MovableTileSprite *tile7 = [MovableTileSprite sprite];
        tile7.characterId = self.characterId;
        tile7.col = self.col - 2;
        tile7.row = self.row;
        [self.movableTiles addObject:tile7];
        MovableTileSprite *tile8 = [MovableTileSprite sprite];
        tile8.characterId = self.characterId;
        tile8.col = self.col;
        tile8.row = self.row + 2;
        [self.movableTiles addObject:tile8];
        status = ACTIVE;
    }
}

@end
