//
//  GameManager.m
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import "GameManager.h"
#import "Models.h"


@implementation GameManager

-(instancetype)init {
    if (self = [super init]) {
        self.game = [[Game alloc] initWithStubPlayer];
    }
    return self;
}

@end
