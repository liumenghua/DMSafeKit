//
//  DMViewController.m
//  DMSafeKit
//
//  Created by liumenghua on 12/16/2019.
//  Copyright (c) 2019 liumenghua. All rights reserved.
//

#import "DMViewController.h"
#import <DMSafeKit.h>

@interface DMViewController ()

@end

@implementation DMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    [self arrayTest];
    [self mutableArrayTest];
    
    [self dictionaryTest];
    [self mutableDictionaryTest];
    
    [self stringTest];
    [self mutableStringTest];
    
    [self mutableSetTest];
}

#pragma mark - Array

- (void)arrayTest {
    [self arrayTest1];
    [self arrayTest2];
    [self arrayTest3];
    [self arrayTest4];
    [self arrayTest5];
    [self arrayTest6];
    [self arrayTest7];
    [self arrayTest8];
}

#pragma mark - Init

// call arrayWithObjects: count:
- (void)arrayTest1 {
    id obj = nil;
    NSArray *arr = [NSArray arrayWithObject:obj];
    NSLog(@"arr:%@", arr);
}

// call arrayWithObjects: count:
- (void)arrayTest2 {
    id obj = nil;
    NSArray *arr= @[obj, @"Hello, World!", @42];
    NSLog(@"arr:%@", arr);
}

- (void)arrayTest3 {
    id obj = nil;
    id objects[] = { obj, @"Hello, World!", @42 };
    NSUInteger count = sizeof(objects) / sizeof(id);
    NSArray *arr = [NSArray arrayWithObjects:objects count:count];
    NSLog(@"arr:%@", arr);
}

#pragma mark - add

- (void)arrayTest4 {
    id obj = nil;
    NSArray *arr = @[@"Java", @"Pyhone"];
    [arr arrayByAddingObject:obj];
    NSLog(@"arr:%@", arr);
}

#pragma mark - search

// call objectAtIndexedSubscript:
- (void)arrayTest5 {
    NSArray *arr = @[@"Java", @"Python", @"Swift", @"C++", @"JavaScript"];
    NSLog(@"arr:%@", arr);
    
    NSString *obj = arr[20];
    NSLog(@"obj:%@", obj);
}

- (void)arrayTest6 {
    NSArray *arr = @[@"Java", @"Python", @"Swift", @"C++", @"JavaScript"];
    NSLog(@"arr:%@", arr);
    
    NSString *obj = [arr objectAtIndex:10];
    NSLog(@"obj:%@", obj);
}

- (void)arrayTest7 {
    NSArray *arr = @[@"Java", @"Python", @"Swift", @"C++", @"JavaScript"];
    NSLog(@"arr:%@", arr);
    
    NSString *obj1 = [arr objectAtIndexedSubscript:10];
    NSLog(@"obj:%@", obj1);
}

- (void)arrayTest8 {
    NSArray *arr = @[@"Java", @"Python", @"Swift", @"C++", @"JavaScript"];
    NSLog(@"arr:%@", arr);
    
    NSArray *subArr = [arr subarrayWithRange:NSMakeRange(5, 1)];
    NSLog(@"subArr:%@", subArr);
}

#pragma mark - NSMutableArray

- (void)mutableArrayTest {
    [self mutableArrayTest1];
    [self mutableArrayTest2];
    [self mutableArrayTest3];
    [self mutableArrayTest4];
    [self mutableArrayTest5];
    [self mutableArrayTest6];
    [self mutableArrayTest7];
    [self mutableArrayTest8];
//    [self mutableArrayTest9];
    [self mutableArrayTest10];
    [self mutableArrayTest11];
}

#pragma mark - insert

- (void)mutableArrayTest1 {
    id obj = nil;
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python", obj]];
    NSLog(@"mutableArr:%@", mutableArr);
}

// call insertObject：atIndex:
- (void)mutableArrayTest2 {
    NSMutableArray *mutableArr = [NSMutableArray arrayWithCapacity:2];
    [mutableArr addObject:@"Java"];
    id obj = nil;
    [mutableArr addObject:obj];
    NSLog(@"mutableArr:%@", mutableArr);
}

- (void)mutableArrayTest3 {
    id obj = nil;
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python", obj]];
    NSLog(@"mutableArr:%@", mutableArr);
    
    [mutableArr insertObject:obj atIndex:1];
    NSLog(@"mutableArr:%@", mutableArr);
}

#pragma mark - remove

// removeObject: will not crash
- (void)mutableArrayTest4 {
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python"]];
    NSLog(@"mutableArr:%@", mutableArr);
    
    id obj = nil;
    [mutableArr removeObject:obj];
    NSLog(@"mutableArr:%@", mutableArr);
}

- (void)mutableArrayTest5 {
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python"]];
    NSLog(@"mutableArr:%@", mutableArr);
    
    [mutableArr removeObjectAtIndex:10];
    NSLog(@"mutableArr:%@", mutableArr);
}

// removeLastObject and removeAllObjects will not crash
- (void)mutableArrayTest6 {
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python"]];
    NSLog(@"mutableArr:%@", mutableArr);
    
    [mutableArr removeLastObject];
    [mutableArr removeLastObject];
    [mutableArr removeLastObject];
    [mutableArr removeAllObjects];
    
    NSLog(@"mutableArr:%@", mutableArr);
}

- (void)mutableArrayTest7 {
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python"]];
    NSLog(@"mutableArr:%@", mutableArr);
    id obj = nil;
    [mutableArr removeObject:obj inRange:NSMakeRange(0, 20)];
    NSLog(@"mutableArr:%@", mutableArr);
}

- (void)mutableArrayTest8 {
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python"]];
    NSLog(@"mutableArr:%@", mutableArr);
    id obj = nil;
    [mutableArr removeObjectIdenticalTo:obj inRange:NSMakeRange(0, 20)];
    NSLog(@"mutableArr:%@", mutableArr);
}

// 还没找到解决方法
- (void)mutableArrayTest9 {
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python"]];
    NSLog(@"mutableArr:%@", mutableArr);
    
    [mutableArr removeObjectsInRange:NSMakeRange(10, 2)];
    NSLog(@"mutableArr:%@", mutableArr);
}

#pragma mark - modify

- (void)mutableArrayTest10 {
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python"]];
    NSLog(@"mutableArr:%@", mutableArr);
    
    id obj = nil;
    [mutableArr replaceObjectAtIndex:1 withObject:obj];
    NSLog(@"mutableArr:%@", mutableArr);
}

- (void)mutableArrayTest11 {
    NSMutableArray *mutableArr = [NSMutableArray arrayWithArray:@[@"Java", @"Python", @"Swift", @"Swift"]];
    NSLog(@"mutableArr:%@", mutableArr);
    
    [mutableArr exchangeObjectAtIndex:0 withObjectAtIndex:5];
    NSLog(@"mutableArr:%@", mutableArr);
}

#pragma mark - NSDictionary

- (void)dictionaryTest {
    [self dictionaryTest1];
    [self dictionaryTest2];
    [self dictionaryTest3];
    [self dictionaryTest4];
    [self dictionaryTest5];
}

#pragma mark - Init

// call initWithObjects:forKeys:count:
- (void)dictionaryTest1 {
    id obj = nil;
    id value = nil;
    NSDictionary *dict = [NSDictionary dictionaryWithObject:obj forKey:value];
    NSLog(@"dict:%@", dict);
}

// call initWithObjects:forKeys:count:
- (void)dictionaryTest2 {
    id obj = nil;
    id value = nil;
    NSDictionary *dict = @{@"anObject" : obj,
                           @"helloString" : @"Hello, World!",
                           @"magicNumber" : @42,
                           @"aValue" : value};
    NSLog(@"dict:%@", dict);
}

- (void)dictionaryTest3 {
    id key = nil;
    id value = nil;
    NSArray *objects = @[value, @"Hello, World!", @42, @"fdsa"];
    NSArray *keys = @[@"anObject", @"helloString", @"magicNumber", key];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    NSLog(@"dict:%@", dict);
}

- (void)dictionaryTest4 {
    id key = nil;
    id value = nil;
    id objects[] = { value, @"Hello, World!", @42, @"fdsa" };
    id keys[] = { @"anObject", @"helloString", @"magicNumber", key };
    NSUInteger count = sizeof(objects) / sizeof(id);
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:count];
    NSLog(@"dict:%@", dict);
}

#pragma mark - search

// key is nil will not crash
- (void)dictionaryTest5 {
    NSDictionary *dict = @{@"anObject" : @"obj",
                           @"helloString" : @"Hello, World!",
                           @"magicNumber" : @42};
    NSLog(@"dict:%@", dict);
    id key = nil;
    id value = [dict objectForKey:key];
    NSLog(@"value:%@", value);
}

#pragma mark - NSMutableDictionary

- (void)mutableDictionaryTest {
    [self mutableDictionaryTest1];
    [self mutableDictionaryTest2];
    [self mutableDictionaryTest3];
}


- (void)mutableDictionaryTest1 {
    id key = nil;
    id value = nil;
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithCapacity:2];
    [mutableDic setObject:value forKey:@"name"];
    [mutableDic setObject:@"23" forKey:key];
    NSLog(@"dic:%@", mutableDic);
}

- (void)mutableDictionaryTest2 {
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithCapacity:2];
    [mutableDic setObject:@"Jack" forKey:@"name"];
    [mutableDic setObject:@"23" forKey:@"age"];
    NSLog(@"dic:%@", mutableDic);
    
    [mutableDic removeObjectForKey:nil];
    NSLog(@"dic:%@", mutableDic);
}

- (void)mutableDictionaryTest3 {
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithCapacity:2];
    [mutableDic setObject:@"Jack" forKey:@"name"];
    [mutableDic setObject:@"23" forKey:@"age"];
    NSLog(@"dic:%@", mutableDic);
    
    id key = nil;
    NSArray *keys = @[@"age", key];
    
    [mutableDic removeObjectsForKeys:keys];
    NSLog(@"dic:%@", mutableDic);
}

#pragma mark - String

- (void)stringTest {
    [self stringTest1];
    [self stringTest2];
    [self stringTest3];
    [self stringTest4];
}

- (void)stringTest1 {
    NSString *str = @"Hello world";
    NSString *subStr = [str substringToIndex:20];
    NSLog(@"Str: %@", str);
    NSLog(@"subStr: %@", subStr);
}

- (void)stringTest2 {
    NSString *str = @"Hello world";
    NSString *subStr = [str substringFromIndex:12];
    NSLog(@"Str: %@", str);
    NSLog(@"subStr: %@", subStr);
}

- (void)stringTest3 {
    NSString *str = @"Hello world";
    NSString *subStr = [str substringWithRange:NSMakeRange(0, 20)];
    NSLog(@"Str: %@", str);
    NSLog(@"subStr: %@", subStr);
}

- (void)stringTest4 {
    NSString *str = @"Hello world";
    unichar ch = [str characterAtIndex:20];
    NSLog(@"Str: %@", str);
    NSLog(@"subStr: %c", ch);
}

#pragma mark - NSMutableString

- (void)mutableStringTest {
    [self mutableStringTest1];
    [self mutableStringTest2];
    [self mutableStringTest3];
    [self mutableStringTest4];
    [self mutableStringTest5];
    [self mutableStringTest6];
}

- (void)mutableStringTest1 {
    NSMutableString *str = [NSMutableString stringWithString:@"Hello World"];
    NSLog(@"Str: %@", str);
    [str insertString:@"Hello Java" atIndex:20];
    NSLog(@"Str: %@", str);
}

- (void)mutableStringTest2 {
    NSMutableString *str = [NSMutableString stringWithString:@"Hello World"];
    NSLog(@"Str: %@", str);
    [str deleteCharactersInRange:NSMakeRange(0, 20)];
    NSLog(@"Str: %@", str);
}

// 参数为nil也会crash
- (void)mutableStringTest3 {
    NSMutableString *str = [NSMutableString stringWithString:@"Hello World"];
    NSLog(@"Str: %@", str);
    [str appendString:nil];
    NSLog(@"Str: %@", str);
}

- (void)mutableStringTest4 {
    NSMutableString *str = [NSMutableString stringWithString:@"Hello World"];
    NSLog(@"Str: %@", str);
    NSString *name = @"Jack";
    NSString *message = @"Good Night";
    [str appendFormat:@"%@hhh%@", name, message];
    NSLog(@"Str: %@", str);
}

// nil 也会crash
- (void)mutableStringTest5 {
    NSMutableString *str = [NSMutableString stringWithString:@"Hello World"];
    NSLog(@"Str: %@", str);
    id value = nil;
    [str setString:nil];
    NSLog(@"Str: %@", str);
}

- (void)mutableStringTest6 {
    NSMutableString *str = [NSMutableString stringWithString:@"Hello World"];
    NSLog(@"Str: %@", str);
    [str replaceCharactersInRange:NSMakeRange(5, 20) withString:@"Java"];
    NSLog(@"Str: %@", str);
}

#pragma mark - NSMutableSet

- (void)mutableSetTest {
    [self mutableStringTest1];
    [self mutableStringTest2];
}

- (void)mutableSetTest1 {
    id obj = nil;
    NSSet *set = [[NSSet alloc] initWithObjects:@"Java", @"Python", obj, @"Node", nil];
    NSLog(@"set:%@", set);
}

- (void)mutableSetTest2 {
    id obj = nil;
    NSMutableSet *mutebleSet = [NSMutableSet setWithObjects:@"Java", nil];
    NSLog(@"mutebleSet:%@", mutebleSet);
    [mutebleSet addObject:obj];
    [mutebleSet removeObject:obj];
    NSLog(@"mutebleSet:%@", mutebleSet);
}

@end
