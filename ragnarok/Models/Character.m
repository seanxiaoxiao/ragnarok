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

@implementation Character
@synthesize roundFinish;
@synthesize unitMoveSprite1;
@synthesize unitMoveSprite2;
@synthesize unitNo;
@synthesize col;
@synthesize row;

- (void) finishRound {
    roundFinish = true;
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

@end
