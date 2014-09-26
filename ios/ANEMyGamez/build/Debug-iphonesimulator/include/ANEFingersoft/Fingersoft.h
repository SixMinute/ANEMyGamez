#import "FlashRuntimeExtensions.h"

@interface Fingersoft : NSObject

+ (Fingersoft *)sharedInstance;

@end

void FingersoftExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);

void FingersoftExtFinalizer(void* extData);

void FingersoftContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet);

void FingersoftContextFinalizer(FREContext ctx);
