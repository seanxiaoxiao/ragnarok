//
//  DialogBox.h
//  ragnarok
//
//  Created by Xiao Xiao on 4/8/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface DialogBox : CCLayerColor {
    CCSprite *avatar;
    CCLabelTTF *conversation;
}

@property (nonatomic, retain) CCSprite *avatar;
@property (nonatomic, retain) CCLabelTTF *conversation;

@end
