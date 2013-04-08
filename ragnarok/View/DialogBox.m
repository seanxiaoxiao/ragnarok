//
//  DialogBox.m
//  ragnarok
//
//  Created by Xiao Xiao on 4/8/13.
//
//

#import "DialogBox.h"
#import "cocos2d.h"

@implementation DialogBox

@synthesize avatar;
@synthesize conversation;

- (id)init {
    if((self = [super initWithColor:ccc4(255, 255, 255, 180)])) {
        self.position = ccp([[CCDirector sharedDirector] winSize].width / 2 - 150, [[CCDirector sharedDirector] winSize].height / 2 - 100);
        self.contentSize = CGSizeMake(300, 200);
        avatar = [CCSprite spriteWithFile:@"92.png"];
        avatar.position = ccp(70, 100);
        [self addChild:avatar];

        conversation = [CCLabelTTF labelWithString:@"哥的妙计安天下!" fontName:@"Marker Felt" fontSize:20];
        CGSize textSize = [conversation.string sizeWithFont:[UIFont fontWithName:@"Marker Felt" size:20]];
        conversation.anchorPoint = CGPointZero;
        conversation.position = ccp((self.contentSize.width - textSize.width) / 2.0f + 60, 90);
        conversation.color = ccc3(0, 0, 0);
        [self addChild:conversation];
    }
    return self;
}

@end
