//
//  Medalla.h
//  MiCoreDataApp
//
//  Created by iOS on 6/9/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Medalla : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * gimnasio;
@property (nonatomic, retain) UIImage * imagen;

@end
