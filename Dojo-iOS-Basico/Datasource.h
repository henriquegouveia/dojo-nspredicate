//
//  Datasource.h
//  Dojo-iOS-Basico
//
//  Created by Henrique Gouveia on 31/05/17.
//  Copyright © 2017 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Datasource : NSObject

- (NSArray *)personsWithFavoriteFruit:(NSString *)fruit;
- (NSArray *)personsWithAgeBetween:(NSInteger *)min max:(NSInteger)max;
- (NSInteger)allFriendsCount;
- (NSString *)theLastNameOfAllFriends;
- (NSString *)personWhoHasHenriqueGouveiaAsFriend;
- (NSArray *)filterBalance;
- (NSInteger)totalAge30OrHigher;
- (NSString *)peopleWhoseHasOnlyOneFriend;

@end
