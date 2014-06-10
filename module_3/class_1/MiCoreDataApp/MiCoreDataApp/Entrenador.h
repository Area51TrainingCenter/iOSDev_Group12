//
//  Entrenador.h
//  MiCoreDataApp
//
//  Created by iOS on 6/9/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Pokemon;

@interface Entrenador : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * puebloOrigen;
@property (nonatomic, retain) NSNumber * sexo;
@property (nonatomic, retain) NSSet *pokemones;
@property (nonatomic, retain) NSSet *medallas;
@end

@interface Entrenador (CoreDataGeneratedAccessors)

- (void)addPokemonesObject:(Pokemon *)value;
- (void)removePokemonesObject:(Pokemon *)value;
- (void)addPokemones:(NSSet *)values;
- (void)removePokemones:(NSSet *)values;

- (void)addMedallasObject:(NSManagedObject *)value;
- (void)removeMedallasObject:(NSManagedObject *)value;
- (void)addMedallas:(NSSet *)values;
- (void)removeMedallas:(NSSet *)values;

@end
