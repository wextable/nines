//
//  DeckHelper.h
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeckHelper : NSObject

+ (NSMutableArray *)newDeck;
+ (NSMutableArray *)sortedCards:(NSArray *)cards;

@end
