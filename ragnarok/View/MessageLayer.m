//
//  MessageLayer.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/7/13.
//
//

#import "MessageLayer.h"

@implementation MessageLayer

- (id)init
{
	if((self = [super initWithColor:ccc4(255, 255, 255, 0)])) {
        self.position = ccp([[CCDirector sharedDirector] winSize].width / 2 - 150, [[CCDirector sharedDirector] winSize].height / 2 - 100);
        self.contentSize = CGSizeMake(300, 200);
        messageLabel = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:50];
        CGSize textSize = [messageLabel.string sizeWithFont:[UIFont fontWithName:@"Marker Felt" size:50]];
        messageLabel.position = ccp((self.contentSize.width - textSize.width) / 2.0f, 70);
        
        messageLabel.anchorPoint = CGPointZero;
        messageLabel.color = ccc3(0, 0, 0);
        [self addChild:messageLabel];
    }
    return self;
}

- (void)showWithMessage:(NSString *)message
{
    messageLabel.string = message;
    CGSize textSize = [messageLabel.string sizeWithFont:[UIFont fontWithName:@"Marker Felt" size:50]];
    messageLabel.position = ccp((self.contentSize.width - textSize.width) / 2.0f, 70);
    
    CCSequence *sequence = [CCSequence actions:
                            [CCFadeTo actionWithDuration:1 opacity:100],
                            [CCDelayTime actionWithDuration: 1],
                            [CCFadeTo actionWithDuration:1 opacity:0],
                            nil];
    [messageLabel runAction:sequence];
}


@end
