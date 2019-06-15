//
//  ViewController.m
//  ViewControllersTest
//
//  Created by Горявин Владимир on 01.04.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Loading
- (void)loadView {
    
    [super loadView];
    NSLog(@"loadView");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewDidLoad");
    
    self.view.backgroundColor = [UIColor redColor];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        NSLog(@"iPad");
    } else{
        NSLog(@"iPhone");
    }
}


#pragma mark - Views
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}


- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}


- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}


- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
}


#pragma mark - Orientation
- (BOOL)shouldAutorotate {
    return YES;
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskPortrait;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {

    NSLog(@"willRotateToInterfaceOrientation from %ld to %ld", self.interfaceOrientation, toInterfaceOrientation);
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{

    NSLog(@"didRotateFromInterfaceOrientation from %ld to %ld", fromInterfaceOrientation, self.interfaceOrientation);
}

@end
