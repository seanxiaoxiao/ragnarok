//
//  Game.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import "Game.h"
#import "Stage.h"
#import "Character.h"
#import "Constants.h"

@implementation Game
@synthesize round;
@synthesize phase;
@synthesize stage;
@synthesize homeCharacters;
@synthesize enemyCharacters;
@synthesize delegate;

- (void)finishPhase
{
    if (self.phase == homePhase) {
        phase = enemyPhase;
    }
    else {
        phase = homePhase;
        round = round + 1;
    }
}

- (id) initGameWithStageNo:(int)stageNo
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterTouched:) name:EVENT_CHARACTER_TOUCH object:nil];
        stage = [[Stage alloc] initWithStageNo:stageNo];
        homeCharacters = [[NSMutableArray alloc] init];
        enemyCharacters = [[NSMutableArray alloc] init];
        Character *character1 = [[[Character alloc] initWithUnitNo:102] autorelease];
        [character1 setPosition:1 andRow:1];
        character1.characterId = 1;
        Character *character2 = [[[Character alloc] initWithUnitNo:132] autorelease];
        [character2 setPosition:4 andRow:1];
        character2.characterId = 2;
        Character *character3 = [[[Character alloc] initWithUnitNo:126] autorelease];
        character3.characterId = 3;
        [character3 setPosition:1 andRow:2];

        [homeCharacters addObject:character1];
        [homeCharacters addObject:character2];
        [homeCharacters addObject:character3];
    }
    return self;
}

- (void)characterTouched:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    for (Character *character in homeCharacters) {
        if ([[NSNumber numberWithInt:character.characterId] isEqualToNumber:characterId]) {
            [self.delegate addMovableTileAtCol:character.col - 1 andRow:character.row];
            [self.delegate addMovableTileAtCol:character.col + 1 andRow:character.row];
            [self.delegate addMovableTileAtCol:character.col andRow:character.row - 1];
            [self.delegate addMovableTileAtCol:character.col andRow:character.row + 1];
        }
    }
}

- (void)loadMap
{
    [delegate addMapBackground:stage.mapSprite];
    for (Character *character in homeCharacters) {
        [delegate addCharacter:character atCol:character.col andRow:character.row];
    }
}


@end
