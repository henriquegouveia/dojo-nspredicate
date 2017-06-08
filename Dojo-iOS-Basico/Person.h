//
//  Person.h
//  Dojo-iOS-Basico
//
//  Created by Henrique Gouveia on 31/05/17.
//  Copyright © 2017 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+HGCollection.h"

@interface Person : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSNumber *balance;
@property (strong, nonatomic) NSNumber *age;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *company;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *favoriteFruit;
@property (strong, nonatomic) NSArray *friends;

@property (readonly, nonatomic) NSString *fullName;

+ (instancetype)decodeObject:(NSDictionary *)json;

@end
