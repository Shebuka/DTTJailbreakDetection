//  DTTJailbreakDetection.m
//
//  Copyright (c) 2014 Doan Truong Thi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "DTTJailbreakDetection.h"

@implementation DTTJailbreakDetection


- (NSArray *)pathsToCheck
{
    return @[
            @"/.bootstrapped_electra",
            @"/.cydia_no_stash",
            @"/.installed_unc0ver",
            @"/Applications/Cydia.app",
            @"/Applications/FakeCarrier.app",
            @"/Applications/Icy.app",
            @"/Applications/IntelliScreen.app",
            @"/Applications/MxTube.app",
            @"/Applications/RockApp.app",
            @"/Applications/SBSettings.app",
            @"/Applications/Sileo.app",
            @"/Applications/Snoop-itConfig.app",
            @"/Applications/WinterBoard.app",
            @"/Applications/blackra1n.app",
            @"/Library/MobileSubstrate/CydiaSubstrate.dylib",
            @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
            @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
            @"/Library/MobileSubstrate/MobileSubstrate.dylib",
            @"/Library/PreferenceBundles/ABypassPrefs.bundle",
            @"/Library/PreferenceBundles/FlyJBPrefs.bundle",
            @"/Library/PreferenceBundles/LibertyPref.bundle",
            @"/Library/PreferenceBundles/ShadowPreferences.bundle",
            @"/System/Library/LaunchDaemons/com.ikey.bbot.plist",
            @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
            @"/bin/bash",
            @"/bin/sh",
            @"/etc/apt",
            @"/etc/apt/sources.list.d/electra.list",
            @"/etc/apt/sources.list.d/sileo.sources",
            @"/etc/apt/undecimus/undecimus.list",
            @"/etc/ssh/sshd_config",
            @"/jb/amfid_payload.dylib",
            @"/jb/jailbreakd.plist",
            @"/jb/libjailbreak.dylib",
            @"/jb/lzma",
            @"/jb/offsets.plist",
            @"/private/etc/apt",
            @"/private/etc/dpkg/origins/debian",
            @"/private/etc/ssh/sshd_config",
            @"/private/var/Users/",
            @"/private/var/cache/apt/",
            @"/private/var/lib/apt",
            @"/private/var/lib/cydia",
            @"/private/var/log/syslog",
            @"/private/var/mobile/Library/SBSettings/Themes",
            @"/private/var/stash",
            @"/private/var/tmp/cydia.log",
	        @"/var/tmp/cydia.log",
            @"/usr/bin/cycript",
            @"/usr/bin/sshd",
            @"/usr/lib/libcycript.dylib",
            @"/usr/lib/libhooker.dylib",
            @"/usr/lib/libjailbreak.dylib",
            @"/usr/lib/libsubstitute.dylib",
            @"/usr/lib/substrate",
            @"/usr/lib/TweakInject",
            @"/usr/libexec/cydia",
            @"/usr/libexec/cydia/firmware.sh",
            @"/usr/libexec/sftp-server",
            @"/usr/libexec/ssh-keysign",
            @"/usr/local/bin/cycript",
            @"/usr/sbin/frida-server",
            @"/usr/sbin/sshd",
            @"/usr/share/jailbreak/injectme.plist",
            @"/var/binpack",
            @"/var/cache/apt",
            @"/var/checkra1n.dmg",
            @"/var/lib/apt",
            @"/var/lib/cydia",
            @"/var/lib/dpkg/info/mobilesubstrate.md5sums",
            @"/var/log/apt"
            ];
}

- (NSArray *)schemesToCheck
{
    return @[
            @"activator://package/com.example.package",
            @"cydia://package/com.example.package",
            @"filza://package/com.example.package",
            @"sileo://package/com.example.package",
            @"undecimus://package/com.example.package",
            @"zbra://package/com.example.package"
            ];
}

- (BOOL)checkPaths
{
    BOOL jailBreak = NO;

    for (NSString *path in [self pathsToCheck]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
            jailBreak = YES;
            break;
        }
    }

    return jailBreak;
}

- (BOOL)checkSchemes
{
    BOOL jailBreak = NO;

    for (NSString *scheme in [self schemesToCheck]) {
        if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]]){
            jailBreak = YES;
            break;
        }
    }

    return jailBreak;
}

- (BOOL)canViolateSandbox{
	NSError *error;
    BOOL grantsToWrite = NO;
	NSString *string = @".";
	[string writeToFile:@"/private/jailbreak.txt" atomically:YES
						  encoding:NSUTF8StringEncoding error:&error];
	if(!error){
		jailBreak = YES;
	}

    [[NSFileManager defaultManager] removeItemAtPath:@"/private/jailbreak.txt" error:nil];

    return jailBreak;
}

+ (BOOL)isJailbroken
{
#if !(TARGET_IPHONE_SIMULATOR)

   return [self checkPaths] || [self checkSchemes] || [self canViolateSandbox];

#endif

    return NO;
}

@end
