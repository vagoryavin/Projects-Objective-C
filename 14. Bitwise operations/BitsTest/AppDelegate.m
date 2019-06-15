//
//  AppDelegate.m
//  BitsTest
//
//  Created by Горявин Владимир on 13.03.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "VGStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
#pragma mark - Level 1
    /*----- Level 1:
    NSMutableArray* arrayStudents = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i ++) {
        
        // Create a student
        VGStudent* student = [[VGStudent alloc] init];
        
        student.alias = [NSString stringWithFormat: @"Student #%d", i + 1];
        
        // Generation of subjects to be studied by the student
        [self generationOfSubjects: student];
        
        NSLog(@"%@", [student description]);
        NSLog(@"___________________________\n");
        
        // Student add in array
        [arrayStudents addObject: student];
    }
    -----*/
    
#pragma mark - Level 2
    /*----- Level 2:
    
    int countDevelopers = 0;

    for (VGStudent* student in arrayStudents) {
        
        // If the student studies the subject development condition returns YES
        if ([self determineSpecialization: student]) {
            countDevelopers ++;
        }
    }
    
    NSLog(@"Count of students studying programming: %d", countDevelopers);
    -----*/
    
#pragma mark - Level 3
    /*----- Level 3:
    for (VGStudent* student in arrayStudents) {
        
        // If the student studies the subject biology condition returns YES
        if (student.subjectType & VGStudentSubjectTypeBiology) {
            
            NSLog(@"%@: Subject biology canceled", student.alias);
            
            // subjectType will contain the subjects that the student will study, except the subject of biology
            student.subjectType = student.subjectType ^ VGStudentSubjectTypeBiology;
            
            NSLog(@"%@", [student description]);
        }
    }
    -----*/
    
#pragma mark - Level 4
    /*----- Level 4: -----*/
    
    /* Solution №1
    NSMutableArray* bitArray = [[NSMutableArray alloc] init];
    int value = 0, bit = 0;

    value = arc4random() % INT32_MAX;
    
    NSLog(@"Value: %d", value);
    
    do {
        bit = value % 2;
        
        value = value / 2;
        
        [bitArray addObject: [NSNumber numberWithInt: bit]];
        
    } while (value != 0);
    
    bitArray = [[[bitArray reverseObjectEnumerator] allObjects] mutableCopy];
    
    NSString* bitString = [bitArray componentsJoinedByString:@" "];

    NSLog(@"Representation in binary code: %@", bitString);
    */
    
    /* Solution №2 */
    int value = arc4random() % INT32_MAX;
    NSMutableString* bitString = [NSMutableString string];
    
    for (int i = 0; i < sizeof(value)*8; i++) {
        
        int mask = 1 << i;
        
        if (i && !(i % 8)) {
            [bitString insertString:[NSString stringWithFormat: @" "] atIndex: 0];
        }
        
        [bitString insertString:[NSString stringWithFormat: @"%d", (value & mask) ? 1 : 0] atIndex: 0];
        mask = mask << 1;
    }
    NSLog(@"%d: %@", value, bitString);
    
    return YES;
}


- (void) generationOfSubjects:(VGStudent *)student {
    
    int subjectCode = 0, bitNumber = 0;
    
    for (int i = 0; i < 4; i ++) {
        
        do {
            // Generation of a significant bit in the range [0; 7]
            bitNumber = arc4random() % 8;
            
            // Bitwise shift of the 1 to the left by the value of the variable 'bitNumber'
            subjectCode = 1 << bitNumber;

        } while ((student.subjectType & subjectCode) != 0); // The condition must be FALSE then there is a transition to the next statement going after the cycle. The condition is FALSE if bitwise AND returns ZERO, it means that the student has not yet had this subject.

        //The previous subject logical additions with the current thus creates a list of subjects of the student
        student.subjectType = student.subjectType | subjectCode;
    }
}


- (BOOL) determineSpecialization:(VGStudent *)student {
    
    int countTechnicalSubjects = 0, countHumanitarianSubjects = 0;
    BOOL isDeveloper = NO;

    // If the student studies the current subject, the condition returns YES
    if (student.subjectType & VGStudentSubjectTypeBiology) {
        
        countHumanitarianSubjects ++;
    }
    
    if (student.subjectType & VGStudentSubjectTypeMath) {
        
        countTechnicalSubjects ++;
    }
    
    if (student.subjectType & VGStudentSubjectTypeDevelopment) {
        
        countTechnicalSubjects ++;
        isDeveloper = YES;
    }
    
    if (student.subjectType & VGStudentSubjectTypeEngineering) {
        
        countTechnicalSubjects ++;
    }
    
    if (student.subjectType & VGStudentSubjectTypeArt) {
        
        countHumanitarianSubjects ++;
    }
    
    if (student.subjectType & VGStudentSubjectTypePhycology) {
        
        countHumanitarianSubjects ++;
    }
    
    if (student.subjectType & VGStudentSubjectTypeAnatomy) {
        
        countHumanitarianSubjects ++;
    }
    
    if (student.subjectType & VGStudentSubjectTypeLiterature) {
        
        countHumanitarianSubjects ++;
    }
    
    // Comparing the number of technical and humanitarian subjects determine the specialization of the student
    if (countTechnicalSubjects > countHumanitarianSubjects) {
        
        NSLog(@"%@ studies mainly technical subjects", student.alias);
        
    } else if (countTechnicalSubjects < countHumanitarianSubjects) {
        
        NSLog(@"%@ studies mainly humanitarian subjects", student.alias);
        
    } else if (countTechnicalSubjects == countHumanitarianSubjects) {
        
        NSLog(@"%@ studies technical and humanitarian subjects", student.alias);
    }
    
    return isDeveloper;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
