//
//  NSArray+Safety.m
//  NSDictionaryTest
//
//  Created by Liu,Menghua on 2019/12/10.
//  Copyright © 2019 FunnyAssemble. All rights reserved.
//

#import "NSArray+Safety.h"
#import "NSObject+Swizzle.h"

@implementation NSArray (Safety)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_exchangeInstanceMehtodInClass:NSClassFromString(@"__NSPlaceholderArray")
                                     originalSEL:@selector(safe_initWithObjects:count:)
                                          newSEL:@selector(initWithObjects:count:)];
        
        Class class = NSClassFromString(@"__NSArrayI");
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(safe_arrayByAddingObject:)
                                          newSEL:@selector(arrayByAddingObject:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(objectAtIndex:)
                                          newSEL:@selector(safe_objectAtIndex:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(objectAtIndexedSubscript:)
                                          newSEL:@selector(safe_objectAtIndexedSubscript:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(subarrayWithRange:)
                                          newSEL:@selector(safe_subarrayWithRange:)];
    });
}

#pragma mark - init

- (instancetype)safe_initWithObjects:(id *)objects count:(NSUInteger)cnt {
    for (NSUInteger i = 0; i < cnt; i++) {
        if (!objects[i]) {
            objects[i] = [NSNull null];
        }
    }
    return [self safe_initWithObjects:objects count:cnt];
}

- (NSArray *)safe_arrayByAddingObject:(id)object {
    if (!object) {
        return self;
    }
    return [self safe_arrayByAddingObject:object];
}

#pragma mark - search

- (id)safe_objectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self safe_objectAtIndex:index];
}

- (id)safe_objectAtIndexedSubscript:(NSUInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:index];
}

- (NSArray<id> *)safe_subarrayWithRange:(NSRange)range {
    if (range.location + range.length >= self.count) {
        return nil;
    }
    return [self safe_subarrayWithRange:range];
}

@end

@implementation NSMutableArray (Safety)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSArrayM");
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(insertObject:atIndex:)
                                          newSEL:@selector(safe_insertObject:atIndex:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(removeObjectAtIndex:)
                                          newSEL:@selector(safe_removeObjectAtIndex:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(removeObject:inRange:)
                                          newSEL:@selector(safe_removeObject:inRange:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(removeObjectIdenticalTo:inRange:)
                                          newSEL:@selector(safe_removeObjectIdenticalTo:inRange:)];
        
//        [self safe_exchangeInstanceMehtodInClass:class
//                                     originalSEL:@selector(removeObjectsInRange:)
//                                          newSEL:@selector(safe_removeObjectsInRange:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(replaceObjectAtIndex:withObject:)
                                          newSEL:@selector(safe_replaceObjectAtIndex:withObject:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(exchangeObjectAtIndex:withObjectAtIndex:)
                                          newSEL:@selector(safe_exchangeObjectAtIndex:withObjectAtIndex:)];
    });
}


#pragma mark - 增

- (void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject || index > self.count) {
        return;
    }
    [self safe_insertObject:anObject atIndex:index];
}

#pragma mark - 删

- (void)safe_removeObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return;
    }
    [self safe_removeObjectAtIndex:index];
}

- (void)safe_removeObject:(id)anObject inRange:(NSRange)range {
    if (!anObject || range.location + range.length >= self.count) {
        return;
    }
    [self safe_removeObject:anObject inRange:range];
}

- (void)safe_removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range {
    if (!anObject || range.location + range.length >= self.count) {
        return;
    }
    [self safe_removeObjectIdenticalTo:anObject inRange:range];
}

- (void)safe_removeObjectsInRange:(NSRange)range {
    if (range.location + range.length >= self.count) {
        return;
    }
    [self safe_removeObjectsInRange:range];
}

#pragma mark - 改

- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index >= self.count || !anObject) {
        return;
    }
    [self safe_replaceObjectAtIndex:index withObject:anObject];
}

- (void)safe_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    if (idx1 >= self.count || idx2 >= self.count) {
        return;
    }
    [self safe_exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}

@end

