#import "DavinciPlugin.h"
#if __has_include(<davinci/davinci-Swift.h>)
#import <davinci/davinci-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "davinci-Swift.h"
#endif

@implementation DavinciPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDavinciPlugin registerWithRegistrar:registrar];
}
@end
