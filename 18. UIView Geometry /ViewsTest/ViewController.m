//
//  ViewController.m
//  ViewsTest
//
//  Created by Горявин Владимир on 08.04.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView* checkersboardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* Level 1 */
    self.checkersboardView = [self createСheckersboard:self.view andCoordinateCenter:self.view.center];
    
    [self createCellsOfСheckersboard:self.checkersboardView];
    
    /* Level 4 */
    [self placementOfCheckersOnСheckersboard:self.checkersboardView];
}


- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    /* Level 3
    [self changeСolorСells:self.checkersboardView];
    */
    
    /* Level 4 */
    [self changeLocationOfCheckers:self.checkersboardView];
}


- (UIInterfaceOrientationMask) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}


#pragma mark - Level 1 and Level 2
- (UIView* ) createСheckersboard:(UIView* )view andCoordinateCenter:(CGPoint)coordinateCenter {
    
    CGFloat minSize = MIN(CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds));
    
    CGRect outerRect = CGRectMake(0, 0, minSize, minSize);
    
    CGRect innerRect = CGRectZero;
    innerRect.origin = CGPointMake(4, 4);
    innerRect.size = CGSizeMake(minSize - (innerRect.origin.x + innerRect.origin.y),
                                minSize - (innerRect.origin.x + innerRect.origin.y));

    UIView* outerRectView = [[UIView alloc] initWithFrame: outerRect];
    UIView* innerRectView = [[UIView alloc] initWithFrame: innerRect];
    
    outerRectView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin   |
                                     UIViewAutoresizingFlexibleRightMargin  |
                                     UIViewAutoresizingFlexibleTopMargin    |
                                     UIViewAutoresizingFlexibleBottomMargin;
    
    outerRectView.center = coordinateCenter;
    
    /* Level 2
    outerRectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    innerRectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    */
    
    outerRectView.backgroundColor = [UIColor blackColor];
    innerRectView.backgroundColor = [UIColor whiteColor];
    
    [view addSubview: outerRectView];
    [outerRectView addSubview: innerRectView];
    
    return innerRectView;
}


- (void) createCellsOfСheckersboard:(UIView* )viewСheckersboard {
    
    CGFloat lengthOfSide = (CGRectGetWidth(viewСheckersboard.bounds) / 8);
    CGFloat dy = 0, dx = 0;

    CGRect cellSize = viewСheckersboard.bounds;
    cellSize.origin.x = 0;
    cellSize.origin.y = 0;
    
    // Сycle by row
    for (int i = 0; i < 8; i ++) {
        // Cycle by row elements
        for(int j = 0; j < 4; j ++) {
            // Row begin with a white cell
            cellSize.origin.x = lengthOfSide + dx;
            dx = lengthOfSide + cellSize.origin.x;
            
            // Row begin with a black cell
            if (i % 2) {
                cellSize.origin.x = dx - (2 * lengthOfSide);
            }
            cellSize.size = CGSizeMake(lengthOfSide, lengthOfSide);
            
            UIView* cellView = [[UIView alloc] initWithFrame: cellSize];
           
            cellView.autoresizingMask =      UIViewAutoresizingFlexibleWidth        |
                                             UIViewAutoresizingFlexibleHeight       |
                                             UIViewAutoresizingFlexibleTopMargin    |
                                             UIViewAutoresizingFlexibleBottomMargin |
                                             UIViewAutoresizingFlexibleLeftMargin   |
                                             UIViewAutoresizingFlexibleRightMargin;
            
            cellView.backgroundColor = [UIColor blackColor];
            [viewСheckersboard addSubview: cellView];
        }
        dx = 0;
        cellSize.origin.y =  lengthOfSide + dy;
        dy = cellSize.origin.y;
    }
}


#pragma mark - Level 3
- (void) changeСolorСells:(UIView* )viewСheckersboard {
    
     CGFloat hue = (arc4random() % 256 / 256.0);
     CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5 ;
     CGFloat brightness = (arc4random() % 128 / 256.0) + 0.5 ;
     UIColor* color = [UIColor colorWithHue: hue saturation: saturation brightness: brightness alpha: 1.0];
     
     for (UIView* cellView in viewСheckersboard.subviews) {
         cellView.backgroundColor = color;
     }
}


#pragma mark - Level 4
- (UIView* ) creationOfCheckers:(UIView* )viewСheckersboard {
    
    UIView* cellView =  [viewСheckersboard.subviews objectAtIndex: 0];
    CGRect checkerSize = cellView.bounds;
    checkerSize.size = CGSizeMake(CGRectGetWidth(checkerSize) / 2, CGRectGetHeight(checkerSize) / 2);

    UIView* checkerView = [[UIView alloc] initWithFrame: checkerSize];
    [viewСheckersboard addSubview: checkerView];
    
    return checkerView;
}


- (void) placementOfCheckersOnСheckersboard:(UIView* )viewСheckersboard {
    
    UIView* cellView;
    NSArray* arrayCell = viewСheckersboard.subviews;
    
    for (int i = 1; i <= 24; i ++) {
        
        UIView* checkerView = [self creationOfCheckers: viewСheckersboard];
        
        if(i <= 12){
            cellView = arrayCell[i - 1];
            checkerView.backgroundColor = [UIColor blueColor];
        }
        
        if(i > 12){
            cellView = arrayCell[(arrayCell.count - i) + 12];
            checkerView.backgroundColor = [UIColor redColor];
        }
        
        checkerView.center = cellView.center;
    }
}


- (void) changeLocationOfCheckers:(UIView* )viewСheckersboard {
    
    int numberOfCheckers = 24;
    int numberOfCells = 32;
    
    NSMutableSet* setOfUsedCells = [NSMutableSet set];
    
    for (int i = 0; i < numberOfCheckers; i ++) {

        int indexChecker = numberOfCells + i;
        int indexRandomCell = 0;
        
        BOOL isCellUsed = NO;

        do {
            indexRandomCell = arc4random() % numberOfCells;

            if([setOfUsedCells member: @(indexRandomCell)]) { // Cell is used
                isCellUsed = YES;
            } else {                                         //  Cell isn't used
                isCellUsed = NO;
                [setOfUsedCells addObject: @(indexRandomCell)];
            }
        } while(isCellUsed);

        UIView* cellView = [viewСheckersboard.subviews objectAtIndex: indexRandomCell];
        UIView* checkerView = [viewСheckersboard.subviews objectAtIndex: indexChecker];
        
        checkerView.center = cellView.center;
    }
}

@end
