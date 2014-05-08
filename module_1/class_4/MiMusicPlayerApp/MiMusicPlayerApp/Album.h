//
//  Album.h
//  MiMusicPlayerApp
//
//  Created by iOS on 5/7/14.
//  Copyright (c) 2014 Area51. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic,strong) NSString *titulo;
@property (nonatomic) int anho;
@property (nonatomic,strong) NSString *artista;
@property (nonatomic,strong) NSArray *canciones;

@end
