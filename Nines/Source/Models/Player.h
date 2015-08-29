//
//  Player.h
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;

typedef NS_ENUM(NSInteger, PlayerHandSection) {
    PlayerHandSectionHand,
    PlayerHandSectionUp,
    PlayerHandSectionDown
};

@interface Player : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *handCards;
@property (nonatomic, strong) NSMutableArray *upCards;
@property (nonatomic, strong) NSMutableArray *downCards;

- (instancetype)initWithName:(NSString *)name;

- (void)moveCard:(Card *)card fromPlayerHandSection:(PlayerHandSection)fromSection toPlayerHandSection:(PlayerHandSection)toSection;

@end
