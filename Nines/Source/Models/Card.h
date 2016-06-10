//
//  Card.h
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SuitType) {
    SuitTypeClubs,
    SuitTypeSpades,
    SuitTypeDiamonds,
    SuitTypeHearts
};

@interface Card : NSObject

@property (nonatomic, assign) SuitType suit;        // SuitTypeHearts
@property (nonatomic, strong) NSString *shortName;  // K
@property (nonatomic, strong) NSString *name;       // King
@property (nonatomic, strong) NSString *fullName;   // King of Hearts
@property (nonatomic, assign) NSInteger faceValue;  // 2=2, 3=3, 10=10, J=11, A=14
@property (nonatomic, assign) NSInteger playValue;      // 2=14, 3=3, 10=14, J=11, A=14
@property (nonatomic, assign) NSInteger playOnValue;    // 2=2, 3=3, 10=14, J=11, A=14

- (instancetype)initWithFaceValue:(NSInteger)faceValue suit:(SuitType)suit;

@end
