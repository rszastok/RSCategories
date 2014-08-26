//
//  NSMutableDictionary+Empty.m
//  Pods
//
//  Created by Rafał Szastok on 26/08/14.
//
//

#import "NSMutableDictionary+Empty.h"

@implementation NSMutableDictionary (Empty)
- (void)setIfNotNilObject:(id)object forKey:(NSString *)key {
    if (object != nil) {
        [self setValue:object forKey:key];
    }
        
}

- (void)setEvenIfNilObject:(id)object forKey:(NSString *)key {
    if (object != nil) {
        [self setValue:object forKey:key];
    }
    else {
        [self setValue:[NSNull null] forKey:key];
    }
}
@end
