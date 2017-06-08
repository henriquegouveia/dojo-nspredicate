//
//  Datasource.m
//  Dojo-iOS-Basico
//
//  Created by Henrique Gouveia on 31/05/17.
//  Copyright © 2017 Henrique Gouveia. All rights reserved.
//

#import "Datasource.h"
#import "JSONParser.h"
#import "Person.h"

@interface Datasource ()

@property (strong, nonatomic) NSArray *persons;

@end

@implementation Datasource

- (instancetype)init {
    self = [super init];
    if (self) {
        _persons = [JSONParser parseJson];
    }

    return self;
}

#pragma mark - Filter Methods

// Task1
- (NSArray *)personsWithFavoriteFruit:(NSString *)fruit {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.favoriteFruit = %@", fruit];

    return [self.persons filteredArrayUsingPredicate:predicate];
}

// Task2
- (NSArray *)personsWithAgeBetween:(NSInteger)min max:(NSInteger)max {
    NSPredicate *predicateMin = [NSPredicate predicateWithFormat:@"SELF.age > %d", min];
    NSPredicate *predicateMax = [NSPredicate predicateWithFormat: @"SELF.age < %d", max];

    NSPredicate *finalPredicate = [NSCompoundPredicate andPredicateWithSubpredicates: @[predicateMin, predicateMax]];


    return [self.persons filteredArrayUsingPredicate: finalPredicate];
}

// Task3
- (NSInteger)allFriendsCount {
    NSArray *result = [self.persons valueForKeyPath:@"@unionOfArrays.friends"];
    return result.count;
}

// Task4
- (NSString *)theLastNameOfAllFriends {

    NSArray *allFriends = [self.persons valueForKeyPath:@"@unionOfArrays.friends"];

    NSArray *lastNames = [allFriends valueForKeyPath:@"lastName"];

    NSString *result = [lastNames componentsJoinedByString:@", "];

    return result;
}

// Task5
- (NSString *)personWhoHasHenriqueGouveiaAsFriend {

    NSArray *allFriends = [self.persons valueForKeyPath:@"@unionOfArrays.friends"];

    NSPredicate *predicateByFirstName = [NSPredicate predicateWithFormat:@"SELF.firstName = 'Henrique'"];
    NSPredicate *predicateByLastName = [NSPredicate predicateWithFormat:@"SELF.lastName = 'Gouveia'"];

    NSPredicate *finalPredicate = [NSCompoundPredicate andPredicateWithSubpredicates: @[predicateByFirstName, predicateByLastName]];

    __block NSArray *rick = [[allFriends filteredArrayUsingPredicate:finalPredicate] firstObject];
    __block NSString *rickFriendName = @"";

    [self.persons enumerateObjectsUsingBlock:^(Person*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.friends containsObject:rick]) {
            rickFriendName = [obj fullName];
            *stop = YES;
        }
    }];

    return rickFriendName;
}

// Task 6
// Filter balance between 2700 - 3500 OR 30000 - 55000
- (NSArray *)filterBalance {
    NSPredicate *predicateForMinValueForLowBalance = [NSPredicate predicateWithFormat:@"SELF.balance > %d", 2700];
    NSPredicate *predicateForMaxValueForLowBalance = [NSPredicate predicateWithFormat:@"SELF.balance < %d", 3500];
    NSPredicate *predicateLowBalance = [NSCompoundPredicate andPredicateWithSubpredicates:@[predicateForMinValueForLowBalance,
                                                                                            predicateForMaxValueForLowBalance]];

    NSPredicate *predicateForMinValueForHighBalance = [NSPredicate predicateWithFormat:@"SELF.balance > %d", 30000];
    NSPredicate *predicateForMaxValueForHighBalance = [NSPredicate predicateWithFormat:@"SELF.balance < %d", 55000];
    NSPredicate *predicateHighBalance = [NSCompoundPredicate andPredicateWithSubpredicates:@[predicateForMinValueForHighBalance,
                                                                                             predicateForMaxValueForHighBalance]];

    NSPredicate *finalPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:@[predicateLowBalance,
                                                                                      predicateHighBalance]];
    NSArray *filterResult = [self.persons filteredArrayUsingPredicate:finalPredicate];
    return filterResult;
}

// Task7
- (NSInteger)totalAge30OrHigher {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.age >= %d", 30];
    NSArray *filterResult = [self.persons filteredArrayUsingPredicate:predicate];
    NSNumber *total = [filterResult valueForKeyPath:@"@sum.age"];
    return total.integerValue;
}

// Task8
- (NSString *)peopleWhoseHasOnlyOneFriend {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.friends.@count = 1"];
    NSArray *filterResult = [self.persons filteredArrayUsingPredicate:predicate];
    Person *person = [filterResult firstObject];
    return person.fullName;
}

@end
