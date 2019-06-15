//
//  ViewController.m
//  OutletsTest
//
//  Created by Горявин Владимир on 25.04.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* Level 1 */
    [self createСheckersboard:self.view.bounds andCoordinateCenter:self.view.center];
    [self createCellsOfСheckersboard:self.innerRectCheckersboard];
    
    /* Level 4 */
    [self calculationSizesOfCheckers];
    [self placementOfCheckersOnСheckersboard];
}


- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    /* Level 3 */
    [self changeСolorСells];
    
    /* Level 4 */
    [self changeLocationOfCheckers];
}


#pragma mark - Level 1
- (void) createСheckersboard:(CGRect)sizeView andCoordinateCenter:(CGPoint)coordinateCenter {
    
    CGFloat minSize = MIN(CGRectGetWidth(sizeView), CGRectGetHeight(sizeView));
    
    CGRect outerRect = CGRectMake(0, 0, minSize, minSize);
    
    CGRect innerRect = CGRectZero;
    innerRect.origin = CGPointMake(4, 4);
    innerRect.size = CGSizeMake(minSize - (innerRect.origin.x + innerRect.origin.y),
                                minSize - (innerRect.origin.x + innerRect.origin.y));
    
    self.outerRectCheckersboard.frame = outerRect;
    self.innerRectCheckersboard.frame = innerRect;
    
    self.outerRectCheckersboard.center = coordinateCenter;
}


- (void) createCellsOfСheckersboard:(UIView *)viewСheckersboard {
    
    CGFloat lengthOfSide = (CGRectGetWidth(viewСheckersboard.bounds) / 8);
    CGFloat dy = 0, dx = 0;
    
    CGRect cellSize = viewСheckersboard.bounds;
    cellSize.origin.x = 0;
    cellSize.origin.y = 0;
    
    int indexCell = 0;
    
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
            
            UIView *cellView = [self.arrayCells objectAtIndex: indexCell ++];
            cellView.frame = cellSize;
        }
        dx = 0;
        cellSize.origin.y =  lengthOfSide + dy;
        dy = cellSize.origin.y;
    }
}


#pragma mark - Level 3
- (void) changeСolorСells {
    
    CGFloat hue = (arc4random() % 256 / 256.0);
    CGFloat saturation = (arc4random() % 128 / 256.0) + 0.5 ;
    CGFloat brightness = (arc4random() % 128 / 256.0) + 0.5 ;
    UIColor *color = [UIColor colorWithHue: hue saturation: saturation brightness: brightness alpha: 1.0];
    
    for (UIView *cellView in self.arrayCells) {
        cellView.backgroundColor = color;
    }
}


#pragma mark - Level 4
- (void) calculationSizesOfCheckers {
    
    UIView *cellView =  [self.arrayCells objectAtIndex: 0];
    CGRect checkerSize = cellView.bounds;
    checkerSize.size = CGSizeMake(CGRectGetWidth(checkerSize) / 2, CGRectGetHeight(checkerSize) / 2);
    
    for (UIView *checkerView in self.arrayCheckers) {
        checkerView.frame = checkerSize;
    }
}


- (void) placementOfCheckersOnСheckersboard {
    
    UIView *cellView;
    NSArray *arrayCell = self.arrayCells;
    
    for (int i = 0; i < 24; i ++) {
        
        UIView *checkerView = self.arrayCheckers[i];

        if(i < 12) {
            cellView = arrayCell[i];
        }
        
        if(i >= 12) {
            cellView = arrayCell[(arrayCell.count - i) + 11];
        }
        checkerView.center = cellView.center;
    }
}


- (void) changeLocationOfCheckers {
    
    int numberOfCheckers = 24;
    int numberOfCells = 32;
    
    NSMutableSet* setOfUsedCells = [NSMutableSet set];
    
    for (int i = 0; i < numberOfCheckers; i ++) {
        
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
        
        UIView* cellView = self.arrayCells[indexRandomCell];
        UIView* checkerView = self.arrayCheckers[i];
        
        checkerView.center = cellView.center;
    }
}


@end
