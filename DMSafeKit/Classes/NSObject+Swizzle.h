//
//  NSObject+Swizzle.h
//  NSDictionaryTest
//
//  Created by Liu,Menghua on 2019/12/10.
//  Copyright © 2019 FunnyAssemble. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzle)

#pragma mark - Class Method Exchange

+ (void)safe_exchangeClassMehtodInClass:(Class)aClass
                            originalSEL:(SEL)aOriginalSEL
                                 newSEL:(SEL)aNewSEL;

+ (void)safe_exchangeClassMehtodInOriginalClass:(Class)aOriginalClass
                                    originalSEL:(SEL)aOriginalSEL
                                       newClass:(Class)aNewClass
                                         newSEL:(SEL)aNewSEL;

#pragma mark - Instance Method Exchange

+ (void)safe_exchangeInstanceMehtodInClass:(Class)aClass
                              originalSEL:(SEL)aOriginalSEL
                                   newSEL:(SEL)aNewSEL;

+ (void)safe_exchangeInstanceMehtodInOriginalClass:(Class)aOriginalClass
                                      originalSEL:(SEL)aOriginalSEL
                                         newClass:(Class)aNewClass
                                           newSEL:(SEL)aNewSEL;

@end

NS_ASSUME_NONNULL_END
