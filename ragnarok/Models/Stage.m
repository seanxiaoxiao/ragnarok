//
//  Stage.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Stage.h"
#import "cocos2d.h"
#import "MapSprite.h"
#import "Cell.h"
#import "Character.h"
#import "EnemyCharacter.h"
#import "UnitCategory.h"
#import "Game.h"

@implementation Stage

@synthesize name;
@synthesize mapSprite;
@synthesize width;
@synthesize height;

- (id)initWithStageNo:(int)stageNo
{
    self = [super init];
    if (self) {
        //characterDirectory = [[NSMutableDictionary alloc] init];
        mapSprite = [MapSprite spriteWithFile:[NSString stringWithFormat:@"stage%d.png", stageNo]];
        _stageNo = stageNo;
        width = 20;
        height = 20;
        cells = malloc(height * sizeof(Cell**));
        for (int i = 0; i < height; i++) {
            cells[i] = malloc(width * sizeof(Cell*));
            for (int j = 0; j < width; j++) {
                Cell *newCell = [[Cell alloc] init];
                newCell.moveCost = 1;
                newCell.col = i;
                newCell.row = j;
                cells[i][j] = newCell;
            }
        }
    }
    return self;
}

- (NSMutableArray *)attackableTiles:(Character *)character
{
    NSMutableArray *tiles = [[NSMutableArray alloc] init];
    [self _addAttackableTiles:tiles atCol:character.col andRow:character.row - 1];
    [self _addAttackableTiles:tiles atCol:character.col andRow:character.row + 1];
    [self _addAttackableTiles:tiles atCol:character.col - 1 andRow:character.row];
    [self _addAttackableTiles:tiles atCol:character.col + 1 andRow:character.row];
    return tiles;
}

- (NSArray *)attackableCharacters:(Character *)character
{
    NSMutableArray *characters = [[NSMutableArray alloc] init];
    [self _addAttackableCharacter:characters atCol:character.col andRow:character.row - 1];
    [self _addAttackableCharacter:characters atCol:character.col andRow:character.row + 1];
    [self _addAttackableCharacter:characters atCol:character.col - 1 andRow:character.row];
    [self _addAttackableCharacter:characters atCol:character.col + 1 andRow:character.row];
    return characters;
}

- (void)_addAttackableCharacter:(NSMutableArray *)characters atCol:(int)col andRow:(int)row
{
    Character *reachable = [self _characterAtCol:col andRow:row];
    if (reachable != nil) {
        [characters addObject:reachable];
    }
}

- (void)_addAttackableTiles:(NSMutableArray *)tiles atCol:(int)col andRow:(int)row
{
    if (row >= 0 && row < width && col >= 0 && col < height) {
        [tiles addObject:cells[col][row]];
    }
}

- (NSArray *)reachableCharacters:(Character *)character
{
    int maxCount = character.unitCategory.moves + 1;
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            cells[i][j].used = NO;
        }
    }
    NSMutableArray *characters = [[NSMutableArray alloc] init];
    [self _addReachableCharacter:characters atCol:character.col andRow:character.row withRemain:maxCount];
    return characters;
}

- (void)_addReachableCharacter:(NSMutableArray *)characters atCol:(int)col andRow:(int)row withRemain:(int)moveRemain
{
    if (row >= 0 && row < width &&
        col >= 0 && col < height &&
        moveRemain >= 0 &&
        cells[col][row].used == NO) {
        cells[col][row].used = YES;
        Character *reachable = [self _characterAtCol:col andRow:row];
        if (reachable != nil) {
            [characters addObject:reachable];
        }
    }
    if (row < 0 || row >= width || col < 0 || col >= height || moveRemain == 0) {
        return;
    }
    
    [self _addReachableCharacter:characters atCol:col andRow:row - 1 withRemain:moveRemain - cells[col][row].moveCost];
    [self _addReachableCharacter:characters atCol:col andRow:row + 1 withRemain:moveRemain - cells[col][row].moveCost];
    [self _addReachableCharacter:characters atCol:col - 1 andRow:row withRemain:moveRemain - cells[col][row].moveCost];
    [self _addReachableCharacter:characters atCol:col + 1 andRow:row withRemain:moveRemain - cells[col][row].moveCost];
}


- (void)_addReachableCharacter2:(NSMutableArray *)characters atCol:(int)col andRow:(int)row withRemain:(int)moveRemain
{
    if (row < 0 || row >= width || col < 0 || col >= height || moveRemain == 0) {
        return;
    }

    if (moveRemain >= 0 && cells[col][row].used == NO) {
        cells[col][row].used = YES;
        Character *reachable = [self _characterAtCol:col andRow:row];
        if (reachable != nil) {
            [characters addObject:reachable];
        }
    }
    
    [self _addReachableCharacter:characters atCol:col andRow:row - 1 withRemain:moveRemain - cells[col][row].moveCost];
    [self _addReachableCharacter:characters atCol:col andRow:row + 1 withRemain:moveRemain - cells[col][row].moveCost];
    [self _addReachableCharacter:characters atCol:col - 1 andRow:row withRemain:moveRemain - cells[col][row].moveCost];
    [self _addReachableCharacter:characters atCol:col + 1 andRow:row withRemain:moveRemain - cells[col][row].moveCost];
}

- (NSMutableArray *)movableTiles:(Character *)character
{
    int maxCount = character.unitCategory.moves;
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            cells[i][j].used = NO;
        }
    }
    NSMutableArray *tiles = [[NSMutableArray alloc] init];
    [self _addMovableTile:tiles atCol:character.col andRow:character.row withRemain:maxCount];
    return tiles;
}


- (void)_addMovableTile:(NSMutableArray *)tiles atCol:(int)col andRow:(int)row withRemain:(int)moveRemain
{
    if (row >= 0 && row < width && col >= 0 && col < height && moveRemain >= 0 && cells[col][row].used == NO) {
        cells[col][row].used = YES;
        if ([self _tileCanAddAtCol:col andRow:row]) {
            [tiles addObject:cells[col][row]];
        }
    }
    if (row < 0 || row >= width || col < 0 || col >= height || moveRemain == 0) {
        return;
    }

    [self _addMovableTile:tiles atCol:col andRow:row - 1 withRemain:moveRemain - cells[col][row].moveCost];
    [self _addMovableTile:tiles atCol:col andRow:row + 1 withRemain:moveRemain - cells[col][row].moveCost];
    [self _addMovableTile:tiles atCol:col - 1 andRow:row withRemain:moveRemain - cells[col][row].moveCost];
    [self _addMovableTile:tiles atCol:col + 1 andRow:row withRemain:moveRemain - cells[col][row].moveCost];
}

- (BOOL)_tileCanAddAtCol:(int)col andRow:(int)row
{
    Game *game = [Game sharedGame];
    for (Character *character in game.homeCharacters) {
        if (character.col == col && character.row == row && character.status != DEAD) {
            return NO;
        }
    }
    for (EnemyCharacter *character in game.enemyCharacters) {
        if (character.col == col && character.row == row && character.status != DEAD) {
            return NO;
        }
    }
    return YES;
}

- (Character *)_characterAtCol:(int)col andRow:(int)row
{
    Game *game = [Game sharedGame];
    for (Character *character in game.homeCharacters) {
        if (character.col == col && character.row == row) {
            return character;
        }
    }
    return nil;
}


@end
