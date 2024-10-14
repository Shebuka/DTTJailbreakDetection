DTTJailbreakDetection
=====================

[![Version](https://img.shields.io/cocoapods/v/DTTJailbreakDetection.svg?style=flat)](http://cocoadocs.org/docsets/DTTJailbreakDetection)
[![License](https://img.shields.io/cocoapods/l/DTTJailbreakDetection.svg?style=flat)](http://cocoadocs.org/docsets/DTTJailbreakDetection)
[![Platform](https://img.shields.io/cocoapods/p/DTTJailbreakDetection.svg?style=flat)](http://cocoadocs.org/docsets/DTTJailbreakDetection)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/shebuka/DTTJailbreakDetection)

# TL;DR

A library to detect if an iOS device is jailbroken or not.

# The good

> Checking whether a device is jailbroken or not can have many advantages for your application. As we have already seen, an attacker can run tools like Cycript, GDB, Snoop-it etc to perform runtime analysis and steal sensitive data from within your application. If you are really looking to add an extra layer of security for your application, you should not allow your application to be run on a jailbroken device. [Prateek Gianchandani]

# The bad

> Please note that millions of users jailbreak their devices and hence not allowing an application to be run on a jailbroken device could have a significant impact on your user base. Another thing you can do is instead block some of the features in your application rather than disabing it entirely. [Prateek Gianchandani]

# Installation

## 1a. Setup with CocoaPods
The easiest way to install DTTJailbreakDetection is to use CocoaPods. Just add the following line to your Podfile:

```ruby
pod 'DTTJailbreakDetection'
```

## 1b. Add source
Add `IOSSecuritySuite/*.swift` files to your project

## 2. Update Info.plist
After adding DTTJailbreakDetection to your project, you will also need to update your main Info.plist. There is a check in jailbreak detection routine that uses ```canOpenURL(_:)``` method and [requires](https://developer.apple.com/documentation/uikit/uiapplication/1622952-canopenurl) specifying URLs that will be queried.

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>activator</string>
    <string>cydia</string>
    <string>filza</string>
    <string>sileo</string>
    <string>undecimus</string>
    <string>zbra</string>
</array>
```

# Usage

To start using DTTJailbreakDetection:

```obj-c
#import <DTTJailbreakDetection/DTTJailbreakDetection.h>
```

## Example

### iOS 9 or newer

```obj-c
if ([DTTJailbreakDetection isJailbroken]) {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"System Requirements"
                                                                             message:@"This app is only supported on unmodified versions of iOS."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action) {
        // End your app
    }];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
```

# License

[MIT](http://thi.mit-license.org/)
