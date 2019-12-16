//
//  NSSet+Safety.m
//  DMSafeKit
//
//  Created by Liu,Menghua on 2019/12/16.
//

#import "NSSet+Safety.h"
#import "NSObject+Swizzle.h"

@implementation NSSet (Safety)

@end

@implementation NSMutableSet (Safety)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_exchangeInstanceMehtodInClass:NSClassFromString(@"__NSSetM")
                                     originalSEL:@selector(addObject:)
                                          newSEL:@selector(safe_addObject:)];
        
        [self safe_exchangeInstanceMehtodInClass:NSClassFromString(@"__NSSetM")
                                     originalSEL:@selector(removeObject:)
                                          newSEL:@selector(safe_removeObject:)];
    });
}

#pragma mark - 增

- (void)safe_addObject:(id)object {
    if (!object) {
        return;
    }
    [self safe_addObject:object];
}

- (void)safe_removeObject:(id)object {
    if (!object) {
        return;
    }
    [self safe_removeObject:object];
}

@end
