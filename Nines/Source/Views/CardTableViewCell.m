//
//  CardTableViewCell.m
//  Nines
//
//  Created by Wesley St. John on 8/28/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import "CardTableViewCell.h"
#import "Card.h"

@implementation CardTableViewCell

+ (instancetype)cellForTableView:(UITableView *)tableView withCard:(Card *)card isFaceUp:(BOOL)isFaceUp {
    CardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.isFaceUp = isFaceUp;
    cell.card = card;
    return cell;
}

-(void)setCard:(Card *)card {
    _card = card;

    [self updateUI];
}

-(void)setIsFaceUp:(BOOL)isFaceUp {
    _isFaceUp = isFaceUp;
    
    [self updateUI];
}

- (void)updateUI {
    if (self.isFaceUp) {
        self.lblCard.text = self.card.fullName;
    } else {
        self.lblCard.text = @"<card>";
    }
}

@end
