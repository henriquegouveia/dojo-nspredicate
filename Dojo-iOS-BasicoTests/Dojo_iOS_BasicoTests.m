//
//  Dojo_iOS_BasicoTests.m
//  Dojo-iOS-BasicoTests
//
//  Created by Henrique Gouveia on 31/05/17.
//  Copyright © 2017 Henrique Gouveia. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Datasource.h"

@interface Dojo_iOS_BasicoTests : XCTestCase

@property (strong, nonatomic) Datasource *datasource;

@end

@implementation Dojo_iOS_BasicoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _datasource = [[Datasource alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAppleFavoriteFruit {
    NSArray *persons = [self.datasource personsWithFavoriteFruit:@"apple"];
    XCTAssertEqual(persons.count, 8);
}

- (void)testMaxAgeOfPeopleThatLikeApple {
    NSInteger age = 0;

    XCTAssertEqual(age, 39);
}

- (void)testPeopleWithAgeBettwen26and35 {
    NSArray *persons = [self.datasource personsWithAgeBetween:26 max:35];
    XCTAssertEqual(persons.count, 18);
}

- (void)testCountAllFriends {
    NSInteger count = [self.datasource allFriendsCount];
    XCTAssertEqual(count, 144);
}

- (void)testAllFriendsLastName {
    NSString *lastNames = [self.datasource theLastNameOfAllFriends];
    BOOL validation = [lastNames isEqualToString:@"Armstrong, Gilbert, Cruz, Kelly, Barnett, Reeves, Hutchinson, Evans, Matthews, Valencia, Arnold, Boyer, Glass, Weeks, Short, Norman, Sullivan, Mccray, Salinas, Keller, Britt, Jimenez, Vincent, Vazquez, Stanton, Sherman, Franco, Avery, Carpenter, Jacobson, Gutierrez, White, Hale, Lowery, Blankenship, Kaufman, Farley, Foreman, Clay, Dalton, Travis, Wheeler, Hinton, Sampson, Contreras, Martinez, Tran, Spears, Whitaker, Oneill, Savage, Rosales, Gonzales, Ortega, Baker, Delacruz, Snow, Valdez, Whitley, Freeman, Reyes, Rollins, Adkins, Meadows, Alston, Christian, Whitfield, Mcleod, Trujillo, Campos, York, Mercado, Perkins, Whitney, Walter, Riley, Love, Hyde, Bates, Diaz, Decker, Sykes, Marsh, Robbins, Hartman, Thompson, French, Castaneda, Stevens, Solis, Mcclain, Harris, Brock, House, Barrera, Ford, Alvarez, Villarreal, Padilla, Robinson, Stewart, Acevedo, Mayo, Lynch, Rice, Leonard, Henderson, Buchanan, Garcia, Wilson, Lara, English, Durham, Rodgers, Haney, Cameron, Holder, Frederick, Perry, Bowman, Bell, Wyatt, Cleveland, Mcgee, Young, Powers, Bird, Burnett, Huff, Oliver, Mcknight, Walker, Wynn, Garrett, Harper, Carey, Grimes, Mccormick, Gouveia, Leblanc, Ramirez, Estes, Shannon, Patton"];
    XCTAssertEqual(validation, YES);
}

- (void)testPersonWhoseHasHenriqueGouveiaAsFriend {
    NSString *fullName = [self.datasource personWhoHasHenriqueGouveiaAsFriend];
    BOOL validation = [fullName isEqualToString:@"Eunice Hays"];
    XCTAssertEqual(validation, YES);
}

- (void)testBalance {
    NSArray *result = [self.datasource filterBalance];
    XCTAssertEqual(result.count, 12);
}

- (void)testSumPeoplesAgeThatHasMoreThan30 {
    NSInteger totalAge = [self.datasource totalAge30OrHigher];
    XCTAssertEqual(totalAge, 936);
}

- (void)testPeopleThatHasOnlyOneFriend {
    NSString *name = [self.datasource peopleWhoseHasOnlyOneFriend];
    BOOL validation = [name isEqualToString:@"Guadalupe Swanson"];
    XCTAssertEqual(validation, YES);
}

@end
