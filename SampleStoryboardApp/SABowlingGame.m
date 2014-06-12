//
//  SABowlingGame.m
//  SampleStoryboardApp
//
//  Created by Carlos Gavino on 12/6/14.
//
//

#import "SABowlingGame.h"

@interface SABowlingGame ()

@property (nonatomic, strong) NSMutableArray *rolls;
@property (nonatomic) NSUInteger currentRoll;

@end

@implementation SABowlingGame

- (id)init
{
    self = [super init];
    if (self) {
        self.rolls = [NSMutableArray array];
        self.currentRoll = 0;
    }
    return self;
}

- (void) roll:(NSInteger)pins {
    self.rolls[self.currentRoll] = @(pins);
    self.currentRoll++;
}

- (NSInteger)score {
    NSUInteger scores = 0;
    NSUInteger currentFrame = 0;
    
    for (NSUInteger idx = 0; idx < 10; idx++) {
        
        NSUInteger currentScore = [self.rolls[currentFrame] integerValue];
        if (currentScore == 10) {
            
            scores += 10 + [self.rolls[currentFrame + 1] integerValue] + [self.rolls[currentFrame + 2] integerValue];
            currentFrame += 1;
            
        } else {
            
            NSUInteger currentScore = [self.rolls[currentFrame] integerValue] + [self.rolls[currentFrame + 1] integerValue];
            if (currentScore == 10) {
                scores += 10 + [self.rolls[currentFrame + 2] integerValue];
                currentFrame += 2;
            } else {
                scores += currentScore;
                currentFrame += 2;
            }
        }
    }
    
    NSLog(@"scores = %d", scores);
    return scores;
}

@end
