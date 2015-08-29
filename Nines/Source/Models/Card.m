//
//  Card.m
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)initWithFaceValue:(NSInteger)faceValue suit:(SuitType)suit {
    self = [super init];
    
    self.faceValue = faceValue;
    self.suit = suit;
    
    // A's 2's and 10's are worth 14
    if (faceValue == 1 || faceValue == 2 || faceValue == 10) {
        self.value = 14;
    } else {
        // otherwise they are worth face value
        self.value = faceValue;
    }
    
    if (faceValue == 1) {
        self.shortName = @"A";
        self.name = @"Ace";
    } else if (faceValue < 11) {
        self.shortName = [NSString stringWithFormat:@"%ld", faceValue];
        self.name = [NSString stringWithFormat:@"%ld", faceValue];
    } else if (faceValue == 11) {
        self.shortName = @"J";
        self.name = @"Jack";
    } else if (faceValue == 12) {
        self.shortName = @"Q";
        self.name = @"Queen";
    } else {
        self.shortName = @"K";
        self.name = @"King";
    }

    NSString *suitName;
    switch (suit) {
        case SuitTypeClubs: {
            suitName = @"Clubs";
            break;
        }
        case SuitTypeSpades: {
            suitName = @"Spades";
            break;
        }
        case SuitTypeDiamonds: {
            suitName = @"Diamonds";
            break;
        }
        case SuitTypeHearts: {
            suitName = @"Hearts";
            break;
        }
        default: {
            break;
        }
    }
    self.fullName = [NSString stringWithFormat:@"%@ of %@", self.name, suitName];

    return self;
}



- (NSComparisonResult)compare:(Card *)otherCard {
    if (self.value > otherCard.value) {
        return NSOrderedAscending;
    }
    if (self.value < otherCard.value) {
        return NSOrderedDescending;
    }
    if (self.suit < otherCard.suit) {
        return NSOrderedAscending;
    }
    return NSOrderedSame;    
}

-(NSString *)description {
    return self.fullName;
}


@end
