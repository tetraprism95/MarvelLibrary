//
//  MD5Generator.m
//  MarvelComics
//
//  Created by Nuri Chun on 9/2/18.
//  Copyright © 2018 tetra. All rights reserved.
//

#import "MD5Generator.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MD5Generator

+ (NSString *) md5ForString: (NSString *) string {
    const char            *ptr = [string UTF8String];
    unsigned char        md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(ptr, (CC_LONG) strlen(ptr), md5Buffer);
    
    NSMutableString        *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", md5Buffer[i]];
    }
    return output;
}
@end
