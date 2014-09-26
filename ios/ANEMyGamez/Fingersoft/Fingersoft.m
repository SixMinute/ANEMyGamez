//////////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2012 Freshplanet (http://freshplanet.com | opensource@freshplanet.com)
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//    http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//  
//////////////////////////////////////////////////////////////////////////////////////

#import "Fingersoft.h"


#define DEBUG_OUTPUT 1

#if DEBUG_OUTPUT
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif


FREContext FingersoftCtx = nil;
@implementation Fingersoft

static Fingersoft *sharedInstance = nil;

+ (Fingersoft *)sharedInstance
{
    if (sharedInstance == nil)
    {
        sharedInstance = [[super allocWithZone:NULL] init];
    }

    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

@end

DEFINE_ANE_FUNCTION(nullFunction)
{
    return NULL;
}

#ifndef ANEFingersoft
#define ANEFingersoft 1

static void setKeyValFS(NSMutableArray* arr, NSString* name, FREFunction func, int* count, FRENamedFunction* funcs)
{
    if(NULL == funcs)
    {
        NSLog(@"setting key for %@", name);
        [arr addObject:name];
    }
    else
    {
        NSLog(@"setting function for %@", name);
        int i = *count;
        
        NSLog(@"before setting '%@' name", name);
        funcs[i].name = (const uint8_t*)[(NSString*) name UTF8String];
        NSLog(@"after setting '%@' name", name);
        
        funcs[i].functionData = NULL;
        NSLog(@"after setting '%@' functionData", name);
        
        NSLog(@"before setting '%@' function", name);
        funcs[i].function = func;
        NSLog(@"after setting '%@' function", name);
        
        *count = i + 1;
    }
}

static NSString* const INITIALISE 				= @"initialise";
static NSString* const SHOW_BANNER_ADS 			= @"showBannerAds";
static NSString* const LOAD_NEXT_INTERSTITIAL 	= @"loadNextInterstitialAd";
static NSString* const SHOW_INTERSTITIAL_ADS 	= @"showInterstitialAds";
static NSString* const TURN_ADS_OFF 			= @"turnAdsOff";

static void setFunctions(NSMutableArray *funcDict, FRENamedFunction* funcs)
{
    int count = 0;
    setKeyValFS(funcDict,   INITIALISE,               nullFunction,  &count, funcs);
    setKeyValFS(funcDict,   SHOW_BANNER_ADS,          nullFunction,  &count, funcs);
    setKeyValFS(funcDict,   LOAD_NEXT_INTERSTITIAL,   nullFunction,  &count, funcs);
    setKeyValFS(funcDict,   SHOW_INTERSTITIAL_ADS,    nullFunction,  &count, funcs);
    setKeyValFS(funcDict,   TURN_ADS_OFF,             nullFunction,  &count, funcs);
}

void FingersoftContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx,
                                        uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet)
{
    NSLog(@"Entering FingersoftContextInitializer()");
    NSLog(@"version 0.01");
    
    NSMutableArray *funcArr = [[NSMutableArray alloc] init];
    setFunctions(funcArr, NULL);
    
    *numFunctionsToTest = (uint32_t)[funcArr count];
    
    FRENamedFunction* funcs = (FRENamedFunction*) malloc(sizeof(FRENamedFunction) * *numFunctionsToTest);
    setFunctions(funcArr, funcs);
    
    *functionsToSet = funcs;
    
    FingersoftCtx = ctx;
}

void FingersoftContextFinalizer(FREContext ctx)
{
}

void FingersoftExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    *extDataToSet = NULL;
    *ctxInitializerToSet = &FingersoftContextInitializer;
    *ctxFinalizerToSet = &FingersoftContextFinalizer;
}

void FingersoftExtFinalizer(void* extData)
{
    FingersoftCtx = NULL;
}

#endif
