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

enum GamePhase {
    homePhase = 1,
    enemyPhase = 2,
};

@protocol GameDelegate <NSObject>

- (void)addMapBackground:(MapSprite *)backgroundSprite;

- (void)addCharacter:(Character *)character atCol:(int)col andRow:(int)row;

- (void)addMovableTileAtCol:(MovableTileSprite *)tileSprite;

- (void)moveCharacter:(Character *)character toCol:(int)col andRow:(int)row;

- (void)showStatus:(Character *)character;

- (void)dismissStatus;

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

+ (Game *) sharedGame;

@end
