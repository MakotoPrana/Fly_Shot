//
//  FSGameManager.m
//  FlyShot
//
//  Created by Daiki on 12/05/27.
//  Copyright 2012年 Keio University SFC. All rights reserved.
//

#import "FSGameManager.h"
#import "FSGameInfo.h"

@implementation FSGameManager

@synthesize gameTime;
@synthesize onFinishedGame;

static FSGameManager *manager = nil;

+ (FSGameManager *)sharedManager
{
    if (!manager) {
        manager = [[FSGameManager alloc] init];
    }
    return manager;
}

- (void)initGameInfo
{
    gameTime = 0;
}

- (id)init
{
    if (self = [super init]) {
        [self initGameInfo];
    }
    return self;
}

- (void)timer :(ccTime)dt
{
    if (gameTime > finishedGameTime) {
        if (self.onFinishedGame) {
            self.onFinishedGame();
        }
    }
    gameTime += dt;
}

- (void)startTimer
{
    [self schedule:@selector(timer:)];
}

- (void)stopTimer
{
    [self unschedule:@selector(timer:)];
}

- (void)dealloc
{
    [super dealloc];
    [manager release];
}

@end
