//
//  ViewController.h
//  OutletsTest
//
//  Created by Горявин Владимир on 25.04.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *outerRectCheckersboard;
@property (weak, nonatomic) IBOutlet UIView *innerRectCheckersboard;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *arrayCells;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *arrayCheckers;

@end

