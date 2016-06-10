//
//  Game.h
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;
@class Player;

@interface Game : NSObject

@property (nonatomic, strong) NSMutableArray *deckCards;
@property (nonatomic, strong) NSMutableArray *stackCards;
@property (nonatomic, strong) NSArray *players;

- (instancetype)initWithStubPlayer;
- (instancetype)initWithPlayers:(NSArray *)players;

- (Card *)topStackCard;

- (void)dealGame;
- (void)drawCardForPlayer:(Player *)player;
- (void)playCard:(Card *)card forPlayer:(Player *)player;
- (void)pickUpStackForPlayer:(Player *)player;

- (void)debug_putThreeCardsFaceDown;

@end
