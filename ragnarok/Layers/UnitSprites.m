//
//  UnitSprites.m
//  ragnarok
//
//  Created by Xiao Xiao on 1/25/13.
//
//

#import "UnitSprites.h"


@implementation UnitSprites
@synthesize unitNo;
@synthesize unitMoveSprite1;
@synthesize unitMoveSprite2;

- (id)initWithUnitNo:(int) _unitNo
{
    self = [super init];
    if (self) {
        unitNo = _unitNo;
        unitMoveSprite1 = [CCSprite spriteWithFile:[NSString stringWithFormat:@"move-%d.png", unitNo] rect:CGRectMake(0, 0, 24, 24)];
        unitMoveSprite2 = [CCSprite spriteWithFile:[NSString stringWithFormat:@"move-%d.png", unitNo] rect:CGRectMake(0, 25, 24, 24)];
//        NSString *imageName = [NSString stringWithFormat:@"move-%d.png", unitNo];
//        CGImageRef imageToSplit = [UIImage imageNamed:imageName].CGImage;
//        
//        CGImageRef partOfMoveDownImage1AsCG = CGImageCreateWithImageInRect(imageToSplit, CGRectMake(0, 0, 24, 24));
//        unitMoveDown1 = [UIImage imageWithCGImage:partOfMoveDownImage1AsCG];
//        CGImageRelease(partOfMoveDownImage1AsCG);
//
//        CGImageRef partOfMoveDownImage2AsCG = CGImageCreateWithImageInRect(imageToSplit, CGRectMake(0, 24, 24, 24));
//        unitMoveDown2 = [UIImage imageWithCGImage:partOfMoveDownImage1AsCG];
//        CGImageRelease(partOfMoveDownImage2AsCG);
//
//        CGImageRef partOfMoveUpImage1AsCG = CGImageCreateWithImageInRect(imageToSplit, CGRectMake(0, 48, 24, 24));
//        unitMoveUp1 = [UIImage imageWithCGImage:partOfMoveUpImage1AsCG];
//        CGImageRelease(partOfMoveUpImage1AsCG);
//        
//        CGImageRef partOfMoveUpImage2AsCG = CGImageCreateWithImageInRect(imageToSplit, CGRectMake(0, 72, 24, 24));
//        unitMoveUp2 = [UIImage imageWithCGImage:partOfMoveUpImage2AsCG];
//        CGImageRelease(partOfMoveUpImage2AsCG);
//        
//        CGImageRef partOfMoveLeftImage1AsCG = CGImageCreateWithImageInRect(imageToSplit, CGRectMake(0, 96, 24, 24));
//        unitMoveLeft1 = [UIImage imageWithCGImage:partOfMoveLeftImage1AsCG];
//        CGImageRelease(partOfMoveLeftImage1AsCG);
//        
//        CGImageRef partOfMoveLeftImage2AsCG = CGImageCreateWithImageInRect(imageToSplit, CGRectMake(0, 120, 24, 24));
//        unitMoveLeft2 = [UIImage imageWithCGImage:partOfMoveLeftImage2AsCG];
//        CGImageRelease(partOfMoveLeftImage2AsCG);
//        
//        CGImageRef flippedImage = [UIImage imageWithCGImage:imageToSplit
//                                                    scale:1.0 orientation: UIImageOrientationUpMirrored].CGImage;
//        
//        CGImageRef partOfMoveRightImage1AsCG = CGImageCreateWithImageInRect(flippedImage, CGRectMake(0, 96, 24, 24));
//        unitMoveRight1 = [UIImage imageWithCGImage:partOfMoveDownImage1AsCG];
//        CGImageRelease(partOfMoveRightImage1AsCG);
//        
//        CGImageRef partOfMoveRightImage2AsCG = CGImageCreateWithImageInRect(flippedImage, CGRectMake(0, 120, 24, 24));
//        unitMoveRight2 = [UIImage imageWithCGImage:partOfMoveDownImage1AsCG];
//        CGImageRelease(partOfMoveRightImage2AsCG);
//        
//        CGImageRelease(imageToSplit);
//        CGImageRelease(flippedImage);
//
//        CCTexture2D *tex1 = [[CCTexture2D alloc] initWithCGImage:unitMoveDown1.CGImage resolutionType:kCCResolutionUnknown];
//        unitMoveSprite1 = [CCSprite spriteWithTexture:tex1];
//
//        CCTexture2D *tex2 = [[CCTexture2D alloc] initWithCGImage:unitMoveDown2.CGImage resolutionType:kCCResolutionUnknown];
//        unitMoveSprite2 = [CCSprite spriteWithTexture:tex2];
    }
    return self;
}

@end
