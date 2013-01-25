//
//  UnitSprites.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/25/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface UnitSprites : NSObject {
    UIImage *unitMoveDown1;
    UIImage *unitMoveDown2;
    UIImage *unitMoveUp1;
    UIImage *unitMoveUp2;
    UIImage *unitMoveLeft1;
    UIImage *unitMoveLeft2;
    UIImage *unitMoveRight1;
    UIImage *unitMoveRight2;
}

@property (nonatomic, assign, readonly) int unitNo;
@property (nonatomic, retain, readonly) CCSprite *unitMoveSprite1;
@property (nonatomic, retain, readonly) CCSprite *unitMoveSprite2;
@property (nonatomic, retain, readonly) CCSprite *unitStopSprite;



- (id)initWithUnitNo:(int) _unitNo;

@end
