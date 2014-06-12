//
//  SABowlingGameTests.m
//  SampleStoryboardApp
//
//  Created by Carlos Gavino on 12/6/14.
//
//

#import <XCTest/XCTest.h>
#import "SABowlingGame.h"

@interface SABowlingGameTests : XCTestCase

@end

@implementation SABowlingGameTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGutterGame
{
    SABowlingGame *game = [[SABowlingGame alloc] init];
    for (int i = 0; i < 20; i++) {
        [game roll: 0];
    }
    
    XCTAssert([game score] == 0, @"Score should be 0");
}

- (void)testAllOnes
{
    SABowlingGame *game = [[SABowlingGame alloc] init];
    for (int i = 0; i < 20; i++) {
        [game roll: 1];
    }
    
    XCTAssert([game score] == 20, @"Score should be 20");
}

- (void)testOneSpare
{
    SABowlingGame *game = [[SABowlingGame alloc] init];
    [game roll:5];
    [game roll:5];
    [game roll:3];
    
    for (NSUInteger idx = 0; idx < 17; idx++) {
        [game roll:0];
    }
    
    XCTAssert([game score] == 16, @"Score should be 16");
}

- (void)testOneStrike
{
    SABowlingGame *game = [[SABowlingGame alloc] init];
    [game roll:10];
    [game roll:4];
    [game roll:3];
    
    for (NSUInteger idx = 0; idx < 17; idx++) {
        [game roll:0];
    }
    
    XCTAssert([game score] == 24, @"Score should be 24");
}

- (void)testPerfectGame
{
    SABowlingGame *game = [[SABowlingGame alloc] init];
    for (NSUInteger idx = 0; idx < 20; idx++) {
        [game roll:10];
    }
    
    XCTAssert([game score] == 300, @"Score should be 24");
}

@end
