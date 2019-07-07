//
//  ViewController.m
//  AnimationsTest
//
//  Created by Горявин Владимир on 23.06.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat coordinateX = 0;
    CGFloat coordinateY = 0;
    
    /* --- Level 1
    for (int i = 0; i < 4; i ++) {
        [self createView: coordinateX and: coordinateY];
        coordinateY += 150;
    }
     [self animationView];
    --- */
    
    /* --- Level 2,3 --- */
    for (int i = 0; i < 4; i ++) {
        
        if (i == 1) {
            coordinateY = CGRectGetMaxY(self.view.bounds) - 100;
        }
        
        if (i == 2) {
            coordinateX = CGRectGetMaxX(self.view.bounds) - 100;
        }
        
        if (i == 3) {
            coordinateX = CGRectGetMaxX(self.view.bounds) - 100;
            coordinateY = 0;
        }
        
        /* --- Level 2
        [self createView: coordinateX and: coordinateY];
        --- */
        
        /* --- Level 3 --- */
        [self createImageView: coordinateX and: coordinateY];
    }
    [self circularAnimationView];
}


- (void) createView: (CGFloat)coordinateX and: (CGFloat)coordinateY {
    
    CGRect sizeView = CGRectMake(coordinateX, coordinateY, 100, 100);
    
    UIView *view = [[UIView alloc] initWithFrame: sizeView];
    view.backgroundColor = [self randomColor];
    [self.view addSubview: view];
}


- (void) createImageView: (CGFloat)coordinateX and: (CGFloat)coordinateY {
    
    CGRect sizeImageView = CGRectMake(coordinateX, coordinateY, 100, 100);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: sizeImageView];
    [self.view addSubview: imageView];
    
    UIImage* image1 = [UIImage imageNamed:@"action1.jpg"];
    UIImage* image2 = [UIImage imageNamed:@"action2.jpg"];
    UIImage* image3 = [UIImage imageNamed:@"action3.jpg"];
    UIImage* image4 = [UIImage imageNamed:@"action4.jpg"];
    
    NSArray* arrayImages = [NSArray arrayWithObjects:image1, image2, image3, image4, image3, image2, nil];
    
    imageView.animationImages = arrayImages;
    imageView.animationDuration = 0.4f;
    [imageView startAnimating];
}


#pragma mark - Level 1
/*
- (void) animationView {
    
    __block CGFloat coordinateX = 0;
    __block CGFloat coordinateY = 50;
    
    NSArray *arrayAnimationOption = [[NSArray alloc] initWithObjects:
                                                      @(UIViewAnimationOptionCurveEaseInOut),
                                                      @(UIViewAnimationOptionCurveEaseIn),
                                                      @(UIViewAnimationOptionCurveEaseOut),
                                                      @(UIViewAnimationOptionCurveLinear),
                                                      nil];

    for (UIView *view in self.view.subviews) {
        
        NSUInteger valueAnimationOption = [arrayAnimationOption[arc4random() % arrayAnimationOption.count] unsignedIntegerValue];

        [UIView animateWithDuration:10
                              delay:1
                            options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | valueAnimationOption
                         animations:^{
                             coordinateX = CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame) / 2;
                             view.center = CGPointMake(coordinateX, coordinateY);
                             
                             coordinateY = CGRectGetMinY(view.frame) + CGRectGetHeight(view.frame) + CGRectGetHeight(view.frame);
                             
                             view.backgroundColor = [self randomColor];
                         }
                         completion:^(BOOL finished) {
                             NSLog(@"animation finished! %d", finished);
                         }];
    }
}
*/


#pragma mark - Level 2, 3
- (void) circularAnimationView {
    
    NSUInteger lastIndex = self.view.subviews.count - 1;
    
    CGRect positionFirstView = [[self.view.subviews objectAtIndex: 0] frame];
    CGRect positionLastView = [[self.view.subviews objectAtIndex: lastIndex] frame];
    
    __block UIView* view1;
    __block UIView* view2;
    
    BOOL isClockwise = arc4random() % 2;
    
    [UIView animateWithDuration:6
                          delay:0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         for (int i = 0; i < self.view.subviews.count; i ++) {
                             
                             view1 = self.view.subviews[i];

                             if (isClockwise) {
                                 view1 = self.view.subviews[lastIndex - i];
                                 view2.frame = positionLastView;
                                 
                                 if(i < lastIndex){
                                     view2 = self.view.subviews[lastIndex - i - 1];
                                 }
                             } else {
                                 view2.frame = positionFirstView;
                                 
                                 if (i < lastIndex) {
                                     view2 = self.view.subviews[i + 1];
                                 }
                             }
                             view1.frame = view2.frame;
                             [self setColor: view1];
                         }
                     }
                     completion:^(BOOL finished) {
                         [self circularAnimationView];
                     }];
}


- (void) setColor: (UIView *)view{
    
    CGFloat halfHeight = CGRectGetHeight(view.frame) / 2;
    CGFloat halfWidth = CGRectGetWidth(view.frame) / 2;
    
    CGPoint upperLeftCorner = CGPointMake(CGRectGetMinX(self.view.bounds) + halfWidth, CGRectGetMinY(self.view.bounds) + halfHeight);
    CGPoint lowerLeftCorner = CGPointMake(CGRectGetMinX(self.view.bounds) + halfWidth, CGRectGetMaxY(self.view.bounds) - halfHeight);
    
    CGPoint upperRightCorner = CGPointMake(CGRectGetMaxX(self.view.bounds) - halfWidth, CGRectGetMinY(self.view.bounds) + halfHeight);
    CGPoint lowerRightCorner = CGPointMake(CGRectGetMaxX(self.view.bounds) - halfWidth, CGRectGetMaxY(self.view.bounds) - halfHeight);

    
    if (CGPointEqualToPoint(view.center, upperLeftCorner)) {
        
        view.backgroundColor = [UIColor redColor];
        
    } else if (CGPointEqualToPoint(view.center, lowerLeftCorner)){
        
        view.backgroundColor = [UIColor yellowColor];
        
    } else if (CGPointEqualToPoint(view.center, upperRightCorner)){
        
        view.backgroundColor = [UIColor blueColor];
        
    } else if (CGPointEqualToPoint(view.center, lowerRightCorner)){
        
        view.backgroundColor = [UIColor greenColor];
    }
}


- (UIColor *) randomColor {
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;

    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

@end
