//
//  AppDelegate.m
//  TimeTest
//
//  Created by Горявин Владимир on 20.03.2019.
//  Copyright © 2019 Goryavin Vladimir. All rights reserved.
//

#import "AppDelegate.h"
#import "VGStudent.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSDate* date;
@property (strong, nonatomic) NSCalendar* calendar;
@property (strong, nonatomic) NSDateComponents* components;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.calendar = [NSCalendar currentCalendar];
    self.components = [[NSDateComponents alloc] init];

    
#pragma mark - Level 1
    /*----- Level 1: -----*/

    NSMutableArray* studentsArray = [[NSMutableArray alloc] init];

    for (int i = 0; i < 30; i ++) {
        
        // Create a student
        VGStudent* student = [[VGStudent alloc] init];
        
        // Generate year(1969 - 2003), month(1 - 12), day(1 - 31)
        // Set the resulting value to the respective component
        [self.components setYear:  arc4random() % 35 + 1969];
        [self.components setMonth: arc4random() % 12 + 1];
        [self.components setDay:   arc4random() % 31 + 1];

        // Set the date of birth as the value calculated from the given components
        student.dateOfBirth = [self.calendar dateFromComponents: self.components];
        
        student.alias = [NSString stringWithFormat: @"Student#%d", i+1];
        
        // To add a student to the array
        [studentsArray addObject: student];
    }
    
    // [self printStudents: studentsArray];

    
#pragma mark - Level 2
    /*----- Level 2: -----*/
    
    NSArray* namesArray = [[NSArray alloc] initWithObjects:
                                                           @"Vladimir", @"Aleksander", @"Egor", @"Nikita",
                                                           @"Artem", @"Dmitriy", @"Andrey", nil];
    
    NSArray* surnamesArray = [[NSArray alloc] initWithObjects:
                                                             @"Ivanov", @"Petrov", @"Maksimov", @"Davydov",
                                                             @"Egorov", @"Kirillov", @"Makarov", nil];
    
    for (VGStudent* student in studentsArray) {
        
        // Generate a name and surname from the array of namesArray and surnamesArray
        student.name = namesArray[arc4random() % namesArray.count];
        
        student.surname = surnamesArray[arc4random() % surnamesArray.count];
    }
    
    // Sorting students by age
    NSArray* sortedStudentsArray = [studentsArray sortedArrayUsingComparator: ^NSComparisonResult(VGStudent* student1, VGStudent* student2) {
        
        return [student2.dateOfBirth compare: student1.dateOfBirth];
    }];

    [self printStudents: [sortedStudentsArray mutableCopy]];

    
#pragma mark - Level 3
    /*----- Level 3: -----*/
    
    self.date = [NSDate date];
    
    NSMutableDictionary* dictionaryDateOfBirth = [[NSMutableDictionary alloc] init];
    
    for (VGStudent* student in sortedStudentsArray) {
        
        // Divide the student's date of birth into components
        self.components = [self.calendar components: NSCalendarUnitDay | NSCalendarUnitMonth
                                           fromDate: student.dateOfBirth];
        
        // Save the day and month of the student's birth as a string
        NSString* dayAndMonthOfBirth = [NSString stringWithFormat: @"%ld/%ld", [self.components day],
                                                                                    [self.components month]];
        
        // To add student to the dictionary under a key 'dayAndMonthOfBirth'
        [dictionaryDateOfBirth setObject: student forKey: dayAndMonthOfBirth];
    }
    
    // The oldest student is the last in the sorted array by age
    VGStudent* oldStudent = [sortedStudentsArray objectAtIndex: sortedStudentsArray.count - 1];
    
    // The youngest student is the first in the sorted array by age
    VGStudent* youngStudent = [sortedStudentsArray objectAtIndex: 0];
    
    // The difference between the dates of birth of an old student and a young student
    self.components = [self.calendar components: NSCalendarUnitDay | NSCalendarUnitMonth |
                                                NSCalendarUnitYear | NSCalendarUnitWeekOfYear
                                       fromDate: oldStudent.dateOfBirth toDate: youngStudent.dateOfBirth
                                        options: 0];

    NSLog(@"Age difference between the old student and the young student: %@", self.components);
    
    // Start the timer with an interval of 0.5 seconds and in userInfo is transmitted dictionary, keys which are the day and month of birth of the student, and the value is the student
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self
                                       selector:@selector(timerTest:) userInfo: dictionaryDateOfBirth repeats:YES];

    
#pragma mark - Level 4
    /*----- Level 4: -----*/
    
    NSMutableArray* arrayfirstDateOfMonth = [[NSMutableArray alloc] init];
    NSMutableArray* arrayDateOfSunday = [[NSMutableArray alloc] init];
    NSMutableArray* arrayWorkingDays = [[NSMutableArray alloc] init];
    
    NSInteger dayOfYear = 365;
    NSInteger firstDayOfMonth = 1;
    NSInteger sunday = 1;
    NSInteger saturday = 7;
    
    NSInteger countOfWorkingDays = 0;
    NSInteger previousMonth = 1;
    
    // Set the components as the last day of the year
    [self.components setYear:  2019];
    [self.components setMonth: 12];
    [self.components setDay:   31];
    
    // Set the 'lastDayOfYear' as the value calculated from the given components
    NSDate* lastDayOfYear = [self.calendar dateFromComponents: self.components];
    
    // Set the components as the first day of the year
    [self.components setYear:  2019];
    [self.components setMonth: 1];
    [self.components setDay:   1];
    
    // Cycle over all days in the current year
    for (int i = 0; i < dayOfYear; i ++) {
        
        // Set a current date as the value calculated from the given components
        NSDate* currentDate = [self.calendar dateFromComponents: self.components];
        
        // Divide the current date into components
        self.components = [self.calendar components:
                           NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday
                                           fromDate: currentDate];

       // Add the current day to the array 'arrayfirstDateOfMonth' if it's the first day of the month
       if ([self.components day] == firstDayOfMonth) {
            
           [arrayfirstDateOfMonth addObject: currentDate];
        }
        
        // Add the current day to the array 'arrayDateOfSunday' if this day is Sunday
        if ([self.components weekday] == sunday) {
            
            [arrayDateOfSunday addObject: currentDate];
        }
        
        // The next month has come if the current month is not equal to the previous month
        if (previousMonth != [self.components month]) {
            
            // Add the count of working days this month to the array 'arrayWorkingDays'
            [arrayWorkingDays addObject: @(countOfWorkingDays)];
            
            // With the onset of the new month, reset the count of working days in the month
            countOfWorkingDays = 0;
            
            // The current month becomes the previous month
            previousMonth = [self.components month];
        }
        
        // The current day is working day if it isn't Saturday or Sunday
        if ([self.components weekday] != saturday && [self.components weekday] != sunday) {
            
            countOfWorkingDays ++;
            
            // Add the count of working days in the last month to the array 'arrayWorkingDays' if the current day is the last day in the year
            if ([currentDate isEqualToDate: lastDayOfYear]) {
                
                [arrayWorkingDays addObject: @(countOfWorkingDays)];
            }
        }
        
        // Add one day to the current date
        [self.components setDay: [self.components day] + 1];
    }
    
    NSLog(@"\n");
    for (NSDate* date in arrayfirstDateOfMonth) {
        NSLog(@"%@", [self printDate: date]);
    }
    
    NSLog(@"\n");
    for (NSDate* date in arrayDateOfSunday) {
        NSLog(@"%@", [self printDate: date]);
    }
    
    NSLog(@"\n");
    for (int i = 0; i < [arrayWorkingDays count]; i ++) {
        
        NSDate* numberOfTheMonth = arrayfirstDateOfMonth[i];
        NSInteger numberOfWorkingDaysPerMonth = [arrayWorkingDays[i] integerValue];
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: @"MMMM"];
        
        NSLog(@"%@ %ld working days", [dateFormatter stringFromDate: numberOfTheMonth], numberOfWorkingDaysPerMonth);
    }
    
    return YES;
}


- (void) timerTest:(NSTimer *)timer {
    
    BOOL isBirthday = NO;
    
    // Divide a date into components. The initial value 'self.date' is current date
    self.components = [self.calendar components:
                                    NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self.date];
    
    // Add one day to the current date
    [self.components setDay: [self.components day] + 1];
    
    // Set the 'self.date' as the value calculated from the given component
    self.date = [self.calendar dateFromComponents: self.components];

    // Present the сurrent day and month as a string
    NSString* currentDayAndMonth = [NSString stringWithFormat: @"%ld/%ld", [self.components day],
                                                                                    [self.components month]];
            
    // A student's birthday today, if there is an object 'VGStudent' by the key 'currentDayAndMonth' in the dictionary 'dictionaryDateOfBirth'
    VGStudent* studentBirthday = [[timer userInfo] objectForKey: currentDayAndMonth];
    
        if(studentBirthday){

            NSLog(@"%@: Today is %@ %@ birthday", [self printDate: self.date],
                                                            studentBirthday.name, studentBirthday.surname);
            isBirthday = YES;
        }
    
    // Print the current date if today is not the student's birthday
    if (!isBirthday) {
        NSLog(@"%@", [self printDate: self.date]);
    }
}


- (void) printStudents:(NSMutableArray *)studentsArray {
    
    for (VGStudent* student in studentsArray) {
        
        // Age student: the difference between the date of birth of the student and the current date
        self.components = [self.calendar components:
                                           NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate: student.dateOfBirth toDate: [NSDate date]
                                                       options: 0];
        
        NSLog(@"%@ %@ %@: date of birth: %@ age: %ld",
              student.alias, student.name, student.surname, [self printDate: student.dateOfBirth], [self.components year]);
    }
}


- (NSString* ) printDate:(NSDate *) date {
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"dd/MM/yyyy: EEEE"];
    
    return [dateFormatter stringFromDate: date];
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
