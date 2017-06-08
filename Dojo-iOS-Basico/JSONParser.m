//
//  JSONParser.m
//  Dojo-iOS-Basico
//
//  Created by Henrique Gouveia on 31/05/17.
//  Copyright © 2017 Henrique Gouveia. All rights reserved.
//

#import "JSONParser.h"
#import "Person.h"

@implementation JSONParser

+ (NSData *)loadFile {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"persons" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    return data;
}

+ (NSArray *)parseJson {
    NSData *data = [self loadFile];
    NSError *error = nil;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingAllowFragments
                                                           error:&error];

    if (error) {
        return nil;
    }

    NSMutableArray *persons = [NSMutableArray array];
    for (NSDictionary *personJSON in json) {
        Person *person = [Person decodeObject:personJSON];
        [persons addObject:person];
    }

    return persons;

}

@end
