#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>
#import <CallKit/CallKit.h>

CAP_PLUGIN(CallDetector, "CallDetector",
              CAP_PLUGIN_METHOD(startCallDetector, CAPPluginReturnPromise);
              CAP_PLUGIN_METHOD(stopCallDetector, CAPPluginReturnPromise);
              CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
)
