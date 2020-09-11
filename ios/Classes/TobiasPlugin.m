#import "TobiasPlugin.h"

__weak TobiasPlugin* __tobiasPlugin;

@interface TobiasPlugin()

@property (readwrite,copy,nonatomic) FlutterResult callback;

@end



@implementation TobiasPlugin

-(id)init{
    if(self = [super init]){
        
        __tobiasPlugin  = self;
        
    }
    return self;
}

-(void)dealloc{
    
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"com.jarvanmo/tobias"
            binaryMessenger:[registrar messenger]];
  TobiasPlugin* instance = [[TobiasPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
  [registrar addApplicationDelegate:instance];
}




- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    result(FlutterMethodNotImplemented);
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {

    return [self handleOpenURL:url];
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
    return [self handleOpenURL:url];
}


+(BOOL)handleOpenURL:(NSURL*)url{

    return YES;

}


-(BOOL)handleOpenURL:(NSURL*)url{

    return YES;
}

@end
