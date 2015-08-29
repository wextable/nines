//
//  Player.m
//  Nines
//
//  Created by Wesley St. John on 8/28/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import "Player.h"
#import "Models.h"

@implementation Player

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
        self.handCards = [[NSMutableArray alloc] init];
        self.upCards = [[NSMutableArray alloc] init];
        self.downCards = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Moving Cards

- (void)moveCard:(Card *)card fromPlayerHandSection:(PlayerHandSection)fromSection toPlayerHandSection:(PlayerHandSection)toSection {
    
    switch (toSection) {
        case PlayerHandSectionHand: {
            [self.handCards addObject:card];
            break;
        }
        case PlayerHandSectionUp: {
            [self.upCards addObject:card];
            break;
        }
        case PlayerHandSectionDown: {
            [self.downCards addObject:card];
            break;
        }
    }
    
    switch (fromSection) {
        case PlayerHandSectionHand: {
            [self.handCards removeObject:card];
            break;
        }
        case PlayerHandSectionUp: {
            [self.upCards removeObject:card];
            break;
        }
        case PlayerHandSectionDown: {
            [self.downCards removeObject:card];
            break;
        }
    }
    
}

@end
