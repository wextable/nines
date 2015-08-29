//
//  DeckHelper.m
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import "DeckHelper.h"
#import "Models.h"

@implementation DeckHelper

+ (NSMutableArray *)newDeck {
    
    NSMutableArray *deck = [[NSMutableArray alloc] initWithCapacity:52];
    
    for (NSInteger suitIndex=0; suitIndex<4; suitIndex++) {
        for (NSInteger faceValue=1; faceValue<=13; faceValue++) {
            Card *card = [[Card alloc] initWithFaceValue:faceValue suit:suitIndex];
            [deck addObject:card];
        }        
    }
    
    return deck;
}

+ (NSMutableArray *)sortedCards:(NSArray *)cards {
    NSArray *sortedArray = [cards sortedArrayUsingSelector:@selector(compare:)];

    return [sortedArray mutableCopy];
}


@end
