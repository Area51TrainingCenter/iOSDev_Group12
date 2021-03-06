//
//  Pokemon.h
//  MiCoreDataApp
//
//  Created by iOS on 6/11/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entrenador;

@interface Pokemon : NSManagedObject

@property (nonatomic, retain) NSNumber * nivel;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * orden;
@property (nonatomic, retain) NSNumber * sexo;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) Entrenador *entrenador;

@end
