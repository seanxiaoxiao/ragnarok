//
//  Topography.h
//  ragnarok
//
//  Created by Xiao Xiao on 1/22/13.
//
//

#import <Foundation/Foundation.h>

@class UnitCategory;
@interface Topography : NSObject

@property (nonatomic, retain) NSString *name;

- (double) defenseIncreased;

- (int) moveCost:(UnitCategory *)unitCategory;

@end
