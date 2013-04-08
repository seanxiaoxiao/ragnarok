//
//  EnemyCharacter.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/1/13.
//
//

#import "EnemyCharacter.h"
#import "Character.h"
#import "UnitCategory.h"
#import "cocos2d.h"
#import "Footman.h"


@implementation EnemyCharacter



- (id)initWithUnitNo:(int) _unitNo
{
    self = [super initWithUnitNo:_unitNo];
    super.isEnemy = YES;
    return self;
}

@end