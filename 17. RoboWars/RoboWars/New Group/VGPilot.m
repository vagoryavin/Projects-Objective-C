//
//  VGPilot.m
//  RoboWars
//
//  Created by Горявин Владимир on 29.09.2018.
//  Copyright © 2018 Goryavin Vladimir. All rights reserved.
//

#import "VGPilot.h"

@interface VGPilot ()

@property (strong, nonatomic) NSMutableDictionary* shots;
@property (assign, nonatomic) CGPoint coordinateShot;
@property (assign, nonatomic) BOOL wasHit;

@end

/*
CGRect robotRect - размер робота;
CGSize fieldSize - размер поля.
*/

@implementation VGPilot

- (void) restart{
    self.shots = [NSMutableDictionary dictionary];
}

- (CGPoint) fire{
    
    NSLog(@"My ROBOT");
    
    BOOL availableCoordinate = NO;
    CGPoint coordinate = CGPointMake(0, 0);
    
    // Сreate a safe zone
    CGRect safeZone = CGRectMake((int)self.robotRect.origin.x - 1, (int)self.robotRect.origin.y - 1,
                                (int)self.robotRect.size.width + 2, (int)self.robotRect.size.height + 2);
    

    while (!availableCoordinate) {
        
        if (self.wasHit && 0<=self.coordinateShot.x<=(int)self.fieldSize.width && 0<=self.coordinateShot.y<=(int)self.fieldSize.height){
            
            coordinate = self.coordinateShot;
            self.wasHit = NO;
            
        } else{
            coordinate = CGPointMake(arc4random() % (int)self.fieldSize.width, arc4random() % (int)self.fieldSize.height);
        }
        availableCoordinate = !CGRectContainsPoint(safeZone, coordinate) && !CGRectContainsPoint(self.robotRect, coordinate) && ![self.shots objectForKey:NSStringFromCGPoint(coordinate)];
       
    }

    return coordinate;
}


- (void) shotFrom:(id<RWPilot>) robot withCoordinate:(CGPoint) coordinate andResult:(RWShotResult) result{
    
    int i = arc4random_uniform(2) * 2 - 1; // generate 1 or -1
    
    if (result == RWShotResultHit) {
        self.wasHit = YES;
        self.coordinateShot = CGPointMake(coordinate.x, coordinate.y - i);
    }
    
    // Save the coordinates of the shot
    if (!self.shots) {
        self.shots = [NSMutableDictionary dictionary];
    }
    
    [self.shots setObject:@"" forKey:NSStringFromCGPoint(coordinate)];

}

- (NSString*) robotName{
    NSString* name = @"Robot - Killer";
    return name;
}

- (NSString*) victoryPhrase {
    NSString* phrase = @"My mission completed!!!";
    return phrase;
}

- (NSString*) defeatPhrase {
    NSString* phrase = @"I'll be back!";
    return phrase;
}

@end
