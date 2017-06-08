//
//  Person.m
//  Dojo-iOS-Basico
//
//  Created by Henrique Gouveia on 31/05/17.
//  Copyright © 2017 Henrique Gouveia. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)decodeObject:(NSDictionary *)json {
    Person *person = [[Person alloc] init];
    person.firstName = [json objectForKey:@"firstName"];
    person.lastName = [json objectForKey:@"lastName"];
    person.balance = @([[json objectForKey:@"balance"] doubleValue]);
    person.age = @([[json objectForKey:@"age"] integerValue]);
    person.gender = [json objectForKey:@"gender"];
    person.company = [json objectForKey:@"company"];
    person.email = [json objectForKey:@"email"];
    person.favoriteFruit = [json objectForKey:@"favoriteFruit"];

    NSMutableArray *friends = [NSMutableArray array];
    for (NSDictionary *friendJSON in [json objectForKey:@"friends"]) {
        Person *friend = [Person decodeObject:friendJSON];
        [friends addObject:friend];
    }

    person.friends = friends;

    return person;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
