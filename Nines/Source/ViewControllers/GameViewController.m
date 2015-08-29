//
//  GameViewController.m
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import "GameViewController.h"
#import "Models.h"

#import "CardTableViewCell.h"


typedef NS_ENUM(NSInteger, HandTableViewSecion) {
    HandTableViewSecionHandCards,
    HandTableViewSecionUpCards,
    HandTableViewSecionDownCards,
    HandTableViewSecionCount
};

@interface GameViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Game *game = [[Game alloc] initWithStubPlayer];
    [game dealGame];
    [game debug_putThreeCardsFaceDown];
    NSLog(@"STATE OF THE GAME = \n %@", game);
    
    self.myPlayer = [game.players firstObject];
    self.myPlayerState = 1; //MyPlayerStateSelectUpCards;
    
    
}

#pragma MyPlayerState

-(void)setMyPlayerState:(MyPlayerState)myPlayerState {

    _myPlayerState = myPlayerState;
    
    switch (myPlayerState) {
        case MyPlayerStateNotMyTurn:
            self.lblInstructions.text = @"It is not your turn, dude.";
            break;
            
        case MyPlayerStateSelectUpCards:
            self.lblInstructions.text = @"Select your up cards, dude.";
            break;
        
        case MyPlayerStateMyTurn:
            self.lblInstructions.text = @"Your turn, dude.";
            break;
    }

}


#pragma mark - UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return HandTableViewSecionCount;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case HandTableViewSecionHandCards:
            return self.myPlayer.handCards.count;
            break;
        case HandTableViewSecionUpCards:
            return self.myPlayer.upCards.count;
            break;
        case HandTableViewSecionDownCards:
            return self.myPlayer.downCards.count;
            break;
        default:
            return 0;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case HandTableViewSecionHandCards:
            return @"HAND CARDS";
            break;
        case HandTableViewSecionUpCards:
            return @"UP CARDS";
            break;
        case HandTableViewSecionDownCards:
            return @"DOWN CARDS";
            break;
        default:
            return 0;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    Card *card;
    
    switch (indexPath.section) {
        case HandTableViewSecionHandCards:
            card = self.myPlayer.handCards[indexPath.row];
            cell = [CardTableViewCell cellForTableView:tableView withCard:card isFaceUp:YES];
            break;
        case HandTableViewSecionUpCards:
            card = self.myPlayer.upCards[indexPath.row];
            cell = [CardTableViewCell cellForTableView:tableView withCard:card isFaceUp:YES];
            break;
        case HandTableViewSecionDownCards:
            card = self.myPlayer.downCards[indexPath.row];
            cell = [CardTableViewCell cellForTableView:tableView withCard:card isFaceUp:NO];
            break;
        default:
            return [UITableViewCell new];
            break;
    }
    
    return cell;
}

//-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    switch (self.myPlayerState) {
//        case MyPlayerStateNotMyTurn:
//            return NO;
//            break;
//            
//        case MyPlayerStateSelectUpCards:
//            return indexPath.section == HandTableViewSecionHandCards;
//            break;
//            
//        case MyPlayerStateMyTurn:
//            return YES;
//            break;
//    }
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (self.myPlayerState) {
        case MyPlayerStateNotMyTurn:
            return;
            break;
            
        case MyPlayerStateSelectUpCards:
            if (indexPath.section == HandTableViewSecionHandCards) {
                
                // move selected card from hand cards to up cards
                Card *card = self.myPlayer.handCards[indexPath.row];
                [self.myPlayer moveCard:card fromPlayerHandSection:PlayerHandSectionHand toPlayerHandSection:PlayerHandSectionUp];
                
                [tableView reloadData];
                
                if (self.myPlayer.upCards.count == 3) {
                    self.myPlayerState = MyPlayerStateNotMyTurn;
                }
                
            }
            break;
            
        case MyPlayerStateMyTurn:
            return;
            break;
    }
    
    
}



@end
