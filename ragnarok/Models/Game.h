//
//  Game.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import <Foundation/Foundation.h>

enum GamePhase {
    homePhase = 1,
    enemyPhase = 2,
};

@class Stage;
@class Character;
@interface Game : NSObject

@property (nonatomic, assign, readonly) Stage* stage;
@property (nonatomic, assign, readonly) int round;
@property (nonatomic, assign, readonly) enum GamePhase phase;
@property (nonatomic, retain) NSMutableArray *homeCharacters;
@property (nonatomic, retain) NSMutableArray *awayCharacters;

- (void) addCharacter:(Character *)character;

- (void) finishPhase;

@end
