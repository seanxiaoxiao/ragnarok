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
#import "EnemyCharacter.h"

Game *sharedGame;

@implementation Game
@synthesize round;
@synthesize phase;
@synthesize stage;
@synthesize homeCharacters;
@synthesize enemyCharacters;
@synthesize delegate;
@synthesize activeEnemy;

- (void)finishPhase
{
    if (self.phase == homePhase) {
        phase = enemyPhase;
        [self enemyAction];
    }
    else {
        phase = homePhase;
        round = round + 1;
        [delegate displayMessage:[NSString stringWithFormat:@"Round %d", self.round]];
        [self reactivateCharacters];
    }
    [delegate updateHud];
}

- (id)initGameWithStageNo:(int)stageNo
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterTouched:) name:EVENT_CHARACTER_TOUCH object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterMove:) name:EVENT_CHARACTER_MOVE object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterDoneMove:) name:EVENT_CHARACTER_DONE_MOVE object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterReadyAttack:) name:EVENT_CHARACTER_READY_ATTACK object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterDoneAction:) name:EVENT_CHARACTER_DONE_ACTION object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterDecideAttack:) name:EVENT_CHARACTER_DECIDE_ATTACK object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterDoneAttack:) name:EVENT_CHARACTER_DONE_ATTACK object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterCancelAction:) name:EVENT_CHARACTER_CANCEL_ACTION object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(characterDoneCancel:) name:EVENT_CHARACTER_DONE_CANCEL object:nil];
        
        
        stage = [[Stage alloc] initWithStageNo:stageNo];
        round = 1;
        phase = homePhase;

        homeCharacters = [[NSMutableArray alloc] init];
        enemyCharacters = [[NSMutableArray alloc] init];
        
        Character *character1 = [[[Character alloc] initWithUnitNo:120] autorelease];
        [character1 setPosition:7 andRow:2];
        character1.characterId = 1;
        
        Character *character2 = [[[Character alloc] initWithUnitNo:142] autorelease];
        [character2 setPosition:5 andRow:2];
        character2.characterId = 2;
        
        Character *character3 = [[[Character alloc] initWithUnitNo:141] autorelease];
        character3.characterId = 3;
        [character3 setPosition:9 andRow:2];

        [homeCharacters addObject:character1];
        [homeCharacters addObject:character2];
        [homeCharacters addObject:character3];
        
        EnemyCharacter *enemy1 = [[[EnemyCharacter alloc] initWithUnitNo:126] autorelease];
        [enemy1 setPosition:7 andRow:12];
        enemy1.characterId = 4;
        
        EnemyCharacter *enemy2 = [[[EnemyCharacter alloc] initWithUnitNo:102] autorelease];
        [enemy2 setPosition:9 andRow:4];
        enemy2.characterId = 4;
        
        EnemyCharacter *enemy3 = [[[EnemyCharacter alloc] initWithUnitNo:128] autorelease];
        [enemy3 setPosition:11 andRow:12];
        enemy3.characterId = 4;
        
        EnemyCharacter *enemy4 = [[[EnemyCharacter alloc] initWithUnitNo:132] autorelease];
        [enemy4 setPosition:9 andRow:14];
        enemy4.characterId = 4;
        
        [enemyCharacters addObject:enemy1];
        [enemyCharacters addObject:enemy2];
        [enemyCharacters addObject:enemy3];
        [enemyCharacters addObject:enemy4];
                
        sharedGame = self;
    }
    return self;
}

- (void)characterTouched:(NSNotification *)notification
{
    if (self.phase == enemyPhase) {
        return;
    }
    [delegate dismissStatus];
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    for (Character *character in homeCharacters) {
        if (character.status != READY && character.status != DONE && character.status != DEAD) {
            return;
        }
    }
    for (Character *character in homeCharacters) {
        BOOL activated = [character activated];
        [character deactivate];
        if (!activated) {
            if ([[NSNumber numberWithInt:character.characterId] isEqualToNumber:characterId]) {
                [character touched];
                for (MovableTileSprite *tile in character.movableTiles) {
                    [delegate addMovableTileAtCol:tile];
                }
                [delegate showStatus:character];
            }
        }
    }
}

- (void)characterMove:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    NSNumber *col = [notification.userInfo objectForKey:@"TargetCol"];
    NSNumber *row = [notification.userInfo objectForKey:@"TargetRow"];
    
    Character *character = [self getCharacter:[characterId intValue]];
    if (character) {
        [character prepareToMove];
        [character setPosition:[col integerValue] andRow:[row integerValue]];
        [delegate moveCharacter:character toCol:character.col andRow:character.row];
    }
}

- (void)characterDecideAttack:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    NSNumber *col = [notification.userInfo objectForKey:@"TargetCol"];
    NSNumber *row = [notification.userInfo objectForKey:@"TargetRow"];
    
    Character *attacker = [self getCharacter:[characterId intValue]];
    Character *defender = [self getCharacterAtCol:[col intValue] andRow:[row intValue]];
    if (defender && [attacker canAttack:defender]) {
        [attacker attack:defender];
        [delegate dismissActionMenu];
        [delegate characterAttack:attacker on:defender];
    }
}

- (void)characterDoneMove:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    Character *character = [self getCharacter:[characterId intValue]];
    [delegate dismissStatus];
    [delegate showActionMenu:character];
    [character doneMove];
}

- (void)characterDoneAttack:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    Character *character = [self getCharacter:[characterId intValue]];
    [delegate stopCharacterAnimation:character];
    [character doneAction];
    [self checkPhase];
}

- (void)characterDoneAction:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    Character *character = [self getCharacter:[characterId intValue]];
    [character doneAction];
    [delegate dismissActionMenu];
    [delegate stopCharacterAnimation:character];
    [self checkPhase];
}

- (void)characterReadyAttack:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    Character *character = [self getCharacter:[characterId intValue]];
    [character readyToAttack];
    for (AttackableTileSprite *tile in character.attackableTiles) {
        [delegate addAttackableTileAtCol:tile];
    }
}

- (void)characterCancelAction:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    Character *character = [self getCharacter:[characterId intValue]];
    
    if (character) {
        [delegate dismissActionMenu];
        [delegate cancelAction:character];
    }
}

- (void)characterDoneCancel:(NSNotification *)notification
{
    NSNumber *characterId = [notification.userInfo objectForKey:@"CharacterId"];
    Character *character = [self getCharacter:[characterId intValue]];
    
    if (character) {
        [character cancelAction];
    }
}

- (void)loadMap
{
    [delegate addMapBackground:stage.mapSprite];
    for (Character *character in homeCharacters) {
        [delegate addCharacter:character atCol:character.col andRow:character.row];
        [delegate startCharacterAnimation:character];
    }
    
    for (EnemyCharacter *character in enemyCharacters) {
        [delegate addCharacter:character atCol:character.col andRow:character.row];
        [delegate startCharacterAnimation:character];
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
    for (EnemyCharacter *character in enemyCharacters) {
        if (character.characterId == characterId) {
            return character;
        }
    }
    return nil;
}

- (Character *)getCharacterAtCol: (int)col andRow: (int)row
{
    for (Character *character in homeCharacters) {
        if (character.col == col && character.row == row) {
            return character;
        }
    }
    for (EnemyCharacter *character in enemyCharacters) {
        if (character.col == col && character.row == row) {
            return character;
        }
    }
    return nil;
}

- (void)characterDie:(Character *)character
{
    [delegate dismissCharacter:character];
}

- (void)checkPhase
{
    if (self.phase == homePhase) {
        for (Character *homeCharacter in homeCharacters) {
            if (homeCharacter.status != DONE && homeCharacter.status != DEAD) {
                return;
            }
        }
    }
    else if (self.phase == enemyPhase) {
        for (Character *enemyCharacter in enemyCharacters) {
            if (enemyCharacter.status != DONE && enemyCharacter.status != DEAD) {
                return;
            }
        }
    }
    [self finishPhase];
}

- (void)enemyAction
{
    for (EnemyCharacter *enemyCharacter in enemyCharacters) {
        self.activeEnemy = enemyCharacter;
    }
    [self finishPhase];
}


- (void)reactivateCharacters
{
    for (Character *character in homeCharacters) {
        [character ready];
        [delegate startCharacterAnimation:character];
    }
    for (Character *character in enemyCharacters) {
        [character ready];
        [delegate startCharacterAnimation:character];
    }
}

@end
