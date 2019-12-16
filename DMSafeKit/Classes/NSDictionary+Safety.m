//
//  NSDictionary+Safety.m
//  NSDictionaryTest
//
//  Created by Liu,Menghua on 2019/12/10.
//  Copyright © 2019 FunnyAssemble. All rights reserved.
//

#import "NSDictionary+Safety.h"
#import "NSObject+Swizzle.h"

@implementation NSDictionary (Safety)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_exchangeInstanceMehtodInClass:NSClassFromString(@"__NSPlaceholderDictionary")
                                     originalSEL:@selector(initWithObjects:forKeys:count:)
                                          newSEL:@selector(safe_initWithObjects:forKeys:count:)];
    });
}

- (instancetype)safe_initWithObjects:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)cnt {
    for (NSUInteger i = 0; i < cnt; i++) {
        if (!keys[i]) {
            keys[i] = [NSNull null];
        }
        if (!objects[i]) {
            objects[i] = [NSNull null];
        }
    }
    
    return [self safe_initWithObjects:objects forKeys:keys count:cnt];;
}

@end

@implementation NSMutableDictionary (Safety)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_exchangeInstanceMehtodInClass:NSClassFromString(@"__NSDictionaryM")
                                     originalSEL:@selector(setObject:forKey:)
                                          newSEL:@selector(safe_setObject:forKey:)];
        
        [self safe_exchangeInstanceMehtodInClass:NSClassFromString(@"__NSDictionaryM")
                                     originalSEL:@selector(removeObjectForKey:)
                                          newSEL:@selector(safe_removeObjectForKey:)];
    });
}

- (void)safe_setObject:(id)anObject forKey:(id <NSCopying>)aKey {
    if (!anObject || !aKey) {
        return;
    }
    [self safe_setObject:anObject forKey:aKey];
}

- (void)safe_removeObjectForKey:(id)aKey {
    if (!aKey) {
        return;
    }
    [self safe_removeObjectForKey:aKey];
}

@end
