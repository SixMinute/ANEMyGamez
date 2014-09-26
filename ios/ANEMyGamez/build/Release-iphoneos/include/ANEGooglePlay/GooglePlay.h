#import "FlashRuntimeExtensions.h"

@interface GooglePlay : NSObject

+ (GooglePlay *)sharedInstance;

@end

void GooglePlayExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);

void GooglePlayExtFinalizer(void* extData);

void GooglePlayContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);

void GooglePlayContextFinalizer(FREContext ctx);
