#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "DMSafeKit.h"
#import "NSArray+Safety.h"
#import "NSDictionary+Safety.h"
#import "NSObject+Swizzle.h"
#import "NSSet+Safety.h"
#import "NSString+Safety.h"

FOUNDATION_EXPORT double DMSafeKitVersionNumber;
FOUNDATION_EXPORT const unsigned char DMSafeKitVersionString[];

