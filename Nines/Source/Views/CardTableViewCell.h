//
//  CardTableViewCell.h
//  Nines
//
//  Created by Wesley St. John on 8/28/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Card;

@interface CardTableViewCell : UITableViewCell

@property (nonatomic, strong) Card *card;

@property (nonatomic, strong) IBOutlet UILabel *lblCard;
@property (nonatomic, assign) BOOL isFaceUp;

+ (instancetype)cellForTableView:(UITableView *)tableView withCard:(Card *)card isFaceUp:(BOOL)isFaceUp;

@end
