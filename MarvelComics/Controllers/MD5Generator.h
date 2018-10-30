//
//  MD5Generator.h
//  MarvelComics
//
//  Created by Nuri Chun on 9/2/18.
//  Copyright © 2018 tetra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5Generator : NSObject
+ (NSString *) md5ForString: (NSString *) string;
@end
