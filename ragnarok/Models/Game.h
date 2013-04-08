//
//  Game.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import <Foundation/Foundation.h>

@class Stage;
@class Character;
@class MapSprite;
@class MovableTileSprite;
@class AttackableTileSprite;

enum GamePhase {
    homePhase = 1,
    enemyPhase = 2,
};

@protocol GameDelegate <NSObject>

- (void) addMapBackground:(MapSprite *)backgroundSprite;

- (void) addCharacter:(Character *)character atCol:(int)col andRow:(int)row;

- (void) addMovableTileAtCol:(MovableTileSprite *)tileSprite;

- (void) addAttackableTileAtCol:(AttackableTileSprite *)tileSprite;

- (void) moveCharacter:(Character *)character toCol:(int)col andRow:(int)row;

- (void) showStatus:(Character *)character;

- (void) dismissStatus;

- (void) showActionMenu:(Character *)character;

- (void) dismissActionMenu;

- (void) characterAttack:(Character *)attacker on:(Character *)defender;

- (void) stopCharacterAnimation:(Character *)character;

- (void) startCharacterAnimation:(Character *)character;

- (void) dismissCharacter:(Character *)character;

- (void) cancelAction:(Character *)character;

- (void) displayMessage:(NSString *)message;

- (void) updateHud;

@end


@interface Game : NSObject {
}

@property (nonatomic, assign, readonly) Stage* stage;
@property (nonatomic, assign, readonly) int round;
@property (nonatomic, assign, readonly) enum GamePhase phase;
@property (nonatomic, retain) NSMutableArray *homeCharacters;
@property (nonatomic, retain) NSMutableArray *enemyCharacters;
@property (nonatomic, retain) id<GameDelegate> delegate;

- (void) finishPhase;

- (id) initGameWithStageNo:(int)stageNo;

- (void) loadMap;

- (void) characterDie:(Character *)character;

+ (Game *) sharedGame;

@end
