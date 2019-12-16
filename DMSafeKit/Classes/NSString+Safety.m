//
//  NSString+Safety.m
//  NSDictionaryTest
//
//  Created by Liu,Menghua on 2019/12/13.
//  Copyright © 2019 FunnyAssemble. All rights reserved.
//

#import "NSString+Safety.h"
#import "NSObject+Swizzle.h"

@implementation NSString (Safety)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSCFString");
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(substringToIndex:)
                                          newSEL:@selector(safe_substringToIndex:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(substringFromIndex:)
                                          newSEL:@selector(safe_substringFromIndex:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(substringWithRange:)
                                          newSEL:@selector(safe_substringWithRange:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(characterAtIndex:)
                                          newSEL:@selector(safe_characterAtIndex:)];
    });
}

#pragma mark - 查

- (NSString *)safe_substringToIndex:(NSUInteger)to {
    if (to > self.length) {
        return @"";
    }
    return [self safe_substringToIndex:to];
}

- (NSString *)safe_substringFromIndex:(NSUInteger)from {
    if (from > self.length) {
        return @"";
    }
    return [self safe_substringFromIndex:from];
}

- (NSString *)safe_substringWithRange:(NSRange)range {
    if (range.location + range.length >= self.length) {
        return @"";
    }
    return [self safe_substringWithRange:range];
}

- (unichar)safe_characterAtIndex:(NSUInteger)index {
    if (index > self.length) {
        return 0;
    }
    return [self safe_characterAtIndex:index];
}

@end

@implementation NSMutableString (Safety)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSCFConstantString");
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(insertString:atIndex:)
                                          newSEL:@selector(safe_insertString:atIndex:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(appendString:)
                                          newSEL:@selector(safe_appendString:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(appendFormat:)
                                          newSEL:@selector(safe_appendFormat:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(deleteCharactersInRange:)
                                          newSEL:@selector(safe_deleteCharactersInRange:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(setString:)
                                          newSEL:@selector(safe_setString:)];
        
        [self safe_exchangeInstanceMehtodInClass:class
                                     originalSEL:@selector(replaceCharactersInRange:withString:)
                                          newSEL:@selector(safe_replaceCharactersInRange:withString:)];
    });
}

#pragma mark - 增

- (void)safe_insertString:(NSString *)aString atIndex:(NSUInteger)loc {
    if (!aString || loc > self.length) {
        return;
    }
    [self safe_insertString:aString atIndex:loc];
}

- (void)safe_appendString:(NSString *)aString {
    if (!aString) {
        return;
    }
    [self safe_appendString:aString];
}

- (void)safe_appendFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) {
    if (!format) {
        return;
    }
    va_list ap;
    va_start(ap, format);
    NSString *formatStr = [[NSString alloc] initWithFormat:format locale:[NSLocale currentLocale] arguments:ap];
    va_end(ap);
    [self safe_appendFormat:@"%@", formatStr];
}

#pragma mark - 删

- (void)safe_deleteCharactersInRange:(NSRange)range {
    if (range.location + range.length > self.length) {
        return;
    }
    [self safe_deleteCharactersInRange:range];
}

#pragma mark - 改

- (void)safe_setString:(NSString *)aString {
    if (!aString) {
        return;
    }
    [self safe_setString:aString];
}

- (void)safe_replaceCharactersInRange:(NSRange)range withString:(NSString *)aString {
    if (range.location + range.length > self.length || !aString) {
        return;
    }
    [self safe_replaceCharactersInRange:range withString:aString];
}

@end
