//
//  NSMutableDictionary+Empty.h
//  Pods
//
//  Created by Rafał Szastok on 26/08/14.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Empty)
- (void)setIfNotNilObject:(id)object forKey:(NSString *)key;
- (void)setEvenIfNilObject:(id)object forKey:(NSString *)key;
@end
