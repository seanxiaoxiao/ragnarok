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

Game *sharedGame;

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

- (id)initGameWithStageNo:(int)stageNo
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterTouched:) name:EVENT_CHARACTER_TOUCH object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterMove:) name:EVENT_CHARACTER_MOVE object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterDoneMove:) name:EVENT_CHARACTER_DONE_MOVE object:nil];
        
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
        sharedGame = self;
    }
    return self;
}

- (void)characterTouched:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    for (Character *character in homeCharacters) {
        BOOL activated = [character activated];
        [character deactivate];
        if (!activated) {
            if ([[NSNumber numberWithInt:character.characterId] isEqualToNumber:characterId]) {
                [character touched];
                for (MovableTileSprite *tile in character.movableTiles) {
                    [delegate addMovableTileAtCol:tile];
                }
            }
        }
    }
}

- (void)characterMove:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    NSNumber *col = [notification.userInfo objectForKey:@"TargetCol"];
    NSNumber *row = [notification.userInfo objectForKey:@"TargetRow"];
    
    for (Character *character in homeCharacters) {
        if ([[NSNumber numberWithInt:character.characterId] isEqualToNumber:characterId]) {
            character.col = [col intValue];
            character.row = [row intValue];
            [delegate moveCharacter:character toCol:character.col andRow:character.row];
            return;
        }
    }
}

- (void)characterDoneMove:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    Character *character = [self getCharacter:[characterId intValue]];
    [character doneMove];
}

- (void)loadMap
{
    [delegate addMapBackground:stage.mapSprite];
    for (Character *character in homeCharacters) {
        [delegate addCharacter:character atCol:character.col andRow:character.row];
    }
}

+ (Game *)sharedGame
{
    return sharedGame;
}

- (Character *)getCharacter: (int)characterId
{
    for (Character *character in homeCharacters) {
        if (character.characterId == characterId) {
            return character;
        }
    }
    return nil;
}

@end
