# DMSafeKit

[![CI Status](https://img.shields.io/travis/liumenghua/DMSafeKit.svg?style=flat)](https://travis-ci.org/liumenghua/DMSafeKit)
[![Version](https://img.shields.io/cocoapods/v/DMSafeKit.svg?style=flat)](https://cocoapods.org/pods/DMSafeKit)
[![License](https://img.shields.io/cocoapods/l/DMSafeKit.svg?style=flat)](https://cocoapods.org/pods/DMSafeKit)
[![Platform](https://img.shields.io/cocoapods/p/DMSafeKit.svg?style=flat)](https://cocoapods.org/pods/DMSafeKit)

利用runtim method swizzle 对Objective-C中常用集合等类型进行crash防护，目前支持：
- NSArray/NSMutableArray
- NSDictionary/NSMutableArray
- NSSet/NSMutableSet
- NSString/NSMutableString

## Example

```
id obj = nil;
id value = nil;
NSDictionary *dict = @{@"anObject" : obj,
                       @"helloString" : @"Hello, World!",
                       @"magicNumber" : @42,
                       @"aValue" : value};
NSLog(@"dict:%@", dict);
    
/*
dict:{
     aValue = "<null>";
     anObject = "<null>";
     helloString = "Hello, World!";
     magicNumber = 42;
}
*/
```

## Installation

DMSafeKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DMSafeKit'
```

## Author

liumenghua, return_nil@163.com

## License

DMSafeKit is available under the MIT license. See the LICENSE file for more info.
