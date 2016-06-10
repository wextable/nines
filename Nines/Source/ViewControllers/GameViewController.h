//
//  GameViewController.h
//  Nines
//
//  Created by Wesley St. John on 8/12/15.
//  Copyright (c) 2015 WarEagles. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MyPlayerState) {
    MyPlayerStateNotMyTurn,
    MyPlayerStateSelectUpCards,
    MyPlayerStateDraw,
    MyPlayerStatePlay
};


@class Player;


@interface GameViewController : UIViewController


@property (nonatomic, strong) Player *myPlayer;
@property (nonatomic, assign) MyPlayerState myPlayerState;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UILabel *lblInstructions;

@property (nonatomic, strong) IBOutlet UILabel *lblDeckCardsLeft;

@property (nonatomic, strong) IBOutlet UILabel *lblStackCard;
@property (nonatomic, strong) IBOutlet UILabel *lblStackCardsLeft;

@end

