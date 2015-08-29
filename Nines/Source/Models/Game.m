//
//  Game.m
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import "Game.h"
#import "Models.h"
#import "DeckHelper.h"

@implementation Game

- (instancetype)initWithStubPlayer {
    Player *player = [[Player alloc] initWithName:@"Jon Harris"];
    return [self initWithPlayers:@[player]];
}

- (instancetype)initWithPlayers:(NSArray *)players {
    if (self = [super init]) {
        self.deckCards = [DeckHelper newDeck];
        
        self.stackCards = [[NSMutableArray alloc] init];
        
        self.players = players;
        
    }
    return self;
}

#pragma mark - Moving Cards

- (void)dealGame {    
    for (NSInteger cardIndex=0; cardIndex<9; cardIndex++) {
        for (Player *player in self.players) {
            Card *card = [self drawCardFromDeck];
            [player.handCards addObject:card];
        }
    }
}

- (Card *)drawCardFromDeck {
    Card *topCard;
    if (self.deckCards.count > 0) {
        NSInteger randomIndex = arc4random() % self.deckCards.count;
        topCard = self.deckCards[randomIndex];
        [self.deckCards removeObject:topCard];
    }
    
    return topCard;
}

- (void)debug_putThreeCardsFaceDown {
    for (Player *player in self.players) {
        for (NSInteger downCardIndex=0; downCardIndex<3; downCardIndex++) {
            NSInteger randomIndex = arc4random() % player.handCards.count;
            Card *card = player.handCards[randomIndex];
            [player.downCards addObject:card];
            [player.handCards removeObject:card];
        }
    }
}


-(NSString *)description {
    NSMutableString *toString = [@"Game:\n" mutableCopy];
    [toString appendString:@"    Deck Cards:"];
    for (NSInteger idx=0; idx<self.deckCards.count; idx++) {
        Card *card = self.deckCards[idx];
        [toString appendString:@"\n        "];
        [toString appendString:[card description]];
    }
    [toString appendString:@"\n    Stack Cards:"];
    for (NSInteger idx=0; idx<self.stackCards.count; idx++) {
        Card *card = self.stackCards[idx];
        [toString appendString:@"\n        "];
        [toString appendString:[card description]];
    }
    [toString appendString:@"\n    Players:"];
    for (Player *player in self.players) {
        [toString appendString:[player description]];
    }
    
    return toString;
}

@end
