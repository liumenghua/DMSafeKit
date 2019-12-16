//
//  NSObject+Swizzle.m
//  NSDictionaryTest
//
//  Created by Liu,Menghua on 2019/12/10.
//  Copyright © 2019 FunnyAssemble. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzle)

#pragma mark - Class Method Exchange

+ (void)safe_exchangeClassMehtodInClass:(Class)aClass
                            originalSEL:(SEL)aOriginalSEL
                                 newSEL:(SEL)aNewSEL {
    [self safe_exchangeClassMehtodInOriginalClass:aClass originalSEL:aOriginalSEL newClass:aClass newSEL:aNewSEL];
}

+ (void)safe_exchangeClassMehtodInOriginalClass:(Class)aOriginalClass
                                    originalSEL:(SEL)aOriginalSEL
                                       newClass:(Class)aNewClass
                                         newSEL:(SEL)aNewSEL {
    if (!aOriginalClass || !aNewClass || !aOriginalSEL || !aNewSEL) {
        return;
    }
    
    Method newInstanceMehtod = class_getClassMethod(aOriginalClass, aOriginalSEL);
    Method originalInstanceMethod = class_getClassMethod(aNewClass, aNewSEL);
    method_exchangeImplementations(newInstanceMehtod, originalInstanceMethod);
}

#pragma mark - Instance Method Exchange

+ (void)safe_exchangeInstanceMehtodInClass:(Class)aClass
                              originalSEL:(SEL)aOriginalSEL
                                   newSEL:(SEL)aNewSEL {
    [self safe_exchangeInstanceMehtodInOriginalClass:aClass originalSEL:aOriginalSEL newClass:aClass newSEL:aNewSEL];
}

+ (void)safe_exchangeInstanceMehtodInOriginalClass:(Class)aOriginalClass
                                      originalSEL:(SEL)aOriginalSEL
                                         newClass:(Class)aNewClass
                                           newSEL:(SEL)aNewSEL {
    if (!aOriginalClass || !aNewClass || !aOriginalSEL || !aNewSEL) {
        return;
    }
    
    Method newInstanceMehtod = class_getInstanceMethod(aOriginalClass, aOriginalSEL);
    Method originalInstanceMethod = class_getInstanceMethod(aNewClass, aNewSEL);
    method_exchangeImplementations(newInstanceMehtod, originalInstanceMethod);
}

@end
