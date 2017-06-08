//
//  NSObject+HGCollection.h
//  Dojo-iOS-Basico
//
//  Created by Henrique Gouveia on 31/05/17.
//  Copyright © 2017 Henrique Gouveia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc-runtime.h>

void KBInitializeCollectionExtensions( void ); // call this in main before you do anything

@interface NSObject (HGCollection)

- (id) collect: (NSString*) keyPath;

@end
