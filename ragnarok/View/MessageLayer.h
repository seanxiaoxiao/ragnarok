//
//  MessageLayer.h
//  ragnarok
//
//  Created by Xiao Xiao on 4/7/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface MessageLayer: CCLayerColor {
    CCLabelTTF *messageLabel;
}

- (void)showWithMessage:(NSString *)message;

@end
