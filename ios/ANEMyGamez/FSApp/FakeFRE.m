#import "FlashRuntimeExtensions.h"

/* Context Data ************************************************************/

/**
 * @returns FRE_OK
 *          FRE_WRONG_THREAD
 *          FRE_INVALID_ARGUMENT If nativeData is (FREResult)NULL.
 */

FREResult FREGetContextNativeData( FREContext ctx, void** nativeData ) {return (FREResult)NULL;}

/**
 * @returns FRE_OK
 *          FRE_INVALID_ARGUMENT
 *          FRE_WRONG_THREAD
 */

FREResult FRESetContextNativeData( FREContext ctx, void*  nativeData ) {return (FREResult)NULL;}

/**
 * @returns FRE_OK
 *          FRE_WRONG_THREAD
 *          FRE_INVALID_ARGUMENT If actionScriptData is (FREResult)NULL.
 */

FREResult FREGetContextActionScriptData( FREContext ctx, FREObject *actionScriptData ) {return (FREResult)NULL;}

/**
 * @returns FRE_OK
 *          FRE_WRONG_THREAD
 */

FREResult FRESetContextActionScriptData( FREContext ctx, FREObject  actionScriptData ) {return (FREResult)NULL;}


/**
 * @returns FRE_OK
 *          FRE_INVALID_OBJECT
 *          FRE_WRONG_THREAD
 *          FRE_INVALID_ARGUMENT If objectType is (FREResult)NULL.
 */

FREResult FREGetObjectType( FREObject object, FREObjectType *objectType ) {return (FREResult)NULL;}

/**
 * @return  FRE_OK
 *          FRE_TYPE_MISMATCH
 *          FRE_INVALID_OBJECT
 *          FRE_INVALID_ARGUMENT
 *          FRE_WRONG_THREAD
 */

FREResult FREGetObjectAsInt32 ( FREObject object, int32_t  *value ) {return (FREResult)NULL;}
FREResult FREGetObjectAsUint32( FREObject object, uint32_t *value ) {return (FREResult)NULL;}
FREResult FREGetObjectAsDouble( FREObject object, double   *value ) {return (FREResult)NULL;}
FREResult FREGetObjectAsBool  ( FREObject object, uint32_t *value ) {return (FREResult)NULL;}

/**
 * @return  FRE_OK
 *          FRE_INVALID_ARGUMENT
 *          FRE_WRONG_THREAD
 */

FREResult FRENewObjectFromInt32 ( int32_t  value, FREObject *object ) {return (FREResult)NULL;}
FREResult FRENewObjectFromUint32( uint32_t value, FREObject *object ) {return (FREResult)NULL;}
FREResult FRENewObjectFromDouble( double   value, FREObject *object ) {return (FREResult)NULL;}
FREResult FRENewObjectFromBool  ( uint32_t value, FREObject *object ) {return (FREResult)NULL;}

/**
 * Retrieves a string representation of the object referred to by
 * the given object. The referenced string is immutable and valid
 * only for duration of the call to a registered function. If the
 * caller wishes to keep the the string, they must keep a copy of it.
 *
 * @param object The string to be retrieved.
 *
 * @param length The size, in bytes, of the string. Includes the
 *               (FREResult)NULL terminator.
 *
 * @param value  A pointer to a possibly temporary copy of the string.
 *
 * @return  FRE_OK
 *          FRE_TYPE_MISMATCH
 *          FRE_INVALID_OBJECT
 *          FRE_INVALID_ARGUMENT
 *          FRE_WRONG_THREAD
 */

FREResult FREGetObjectAsUTF8(
                             FREObject       object,
                             uint32_t*       length,
                             const uint8_t** value
                             ) {return (FREResult)NULL;}

/**
 * Creates a new String object that contains a copy of the specified
 * string.
 *
 * @param length The length, in bytes, of the original string. Must include
 *               the (FREResult)NULL terminator.
 *
 * @param value  A pointer to the original string.
 *
 * @param object Receives a reference to the new string object.
 *
 * @return  FRE_OK
 *          FRE_INVALID_ARGUMENT
 *          FRE_WRONG_THREAD
 */

FREResult FRENewObjectFromUTF8(
                               uint32_t        length,
                               const uint8_t*  value ,
                               FREObject*      object
                               ) {return (FREResult)NULL;}

/* Object Access **************************************************************/

/**
 * @param className UTF8-encoded name of the class being constructed.
 *
 * @param thrownException A pointer to a handle that can receive the handle of any ActionScript
 *            Error thrown during execution. May be (FREResult)NULL if the caller does not
 *            want to receive this handle. If not (FREResult)NULL and no error occurs, is set an
 *            invalid handle value.
 *
 * @return  FRE_OK
 *          FRE_TYPE_MISMATCH
 *          FRE_INVALID_OBJECT
 *          FRE_INVALID_ARGUMENT
 *          FRE_ACTIONSCRIPT_ERROR If an ActionScript exception results from calling this method.
 *              In this case, thrownException will be set to the handle of the thrown value.
 *          FRE_ILLEGAL_STATE If a ByteArray or BitmapData has been acquired and not yet released.
 *          FRE_NO_SUCH_NAME
 *          FRE_WRONG_THREAD
 */

FREResult FRENewObject(
                       const uint8_t* className      ,
                       uint32_t       argc           ,
                       FREObject      argv[]         ,
                       FREObject*     object         ,
                       FREObject*     thrownException
                       ) {return (FREResult)NULL;}

/**
 * @param propertyName UTF8-encoded name of the property being fetched.
 *
 * @param thrownException A pointer to a handle that can receive the handle of any ActionScript
 *            Error thrown during getting the property. May be (FREResult)NULL if the caller does not
 *            want to receive this handle. If not (FREResult)NULL and no error occurs, is set an
 *            invalid handle value.
 *
 * @return  FRE_OK
 *          FRE_TYPE_MISMATCH
 *          FRE_INVALID_OBJECT
 *          FRE_INVALID_ARGUMENT
 *
 *          FRE_ACTIONSCRIPT_ERROR If an ActionScript exception results from getting this property.
 *              In this case, thrownException will be set to the handle of the thrown value.
 *
 *          FRE_NO_SUCH_NAME If the named property doesn't exist, or if the reference is ambiguous
 *              because the property exists in more than one namespace.
 *
 *          FRE_ILLEGAL_STATE If a ByteArray or BitmapData has been acquired and not yet released.
 *
 *          FRE_WRONG_THREAD
 */

FREResult FREGetObjectProperty(
                               FREObject       object         ,
                               const uint8_t*  propertyName   ,
                               FREObject*      propertyValue  ,
                               FREObject*      thrownException
                               ) {return (FREResult)NULL;}

/**
 * @param propertyName UTF8-encoded name of the property being set.
 *
 * @param thrownException A pointer to a handle that can receive the handle of any ActionScript
 *            Error thrown during method execution. May be (FREResult)NULL if the caller does not
 *            want to receive this handle. If not (FREResult)NULL and no error occurs, is set an
 *            invalid handle value.
 *
 *
 * @return  FRE_OK
 *          FRE_TYPE_MISMATCH
 *          FRE_INVALID_OBJECT
 *          FRE_INVALID_ARGUMENT
 *          FRE_ACTIONSCRIPT_ERROR If an ActionScript exception results from getting this property.
 *              In this case, thrownException will be set to the handle of the thrown value.
 *
 *          FRE_NO_SUCH_NAME If the named property doesn't exist, or if the reference is ambiguous
 *              because the property exists in more than one namespace.
 *
 *          FRE_ILLEGAL_STATE If a ByteArray or BitmapData has been acquired and not yet released.
 *
 *          FRE_READ_ONLY
 *          FRE_WRONG_THREAD
 */

FREResult FRESetObjectProperty(
                               FREObject       object         ,
                               const uint8_t*  propertyName   ,
                               FREObject       propertyValue  ,
                               FREObject*      thrownException
                               ) {return (FREResult)NULL;}

/**
 * @param methodName UTF8-encoded (FREResult)NULL-terminated name of the method being invoked.
 *
 * @param thrownException A pointer to a handle that can receive the handle of any ActionScript
 *            Error thrown during method execution. May be (FREResult)NULL if the caller does not
 *            want to receive this handle. If not (FREResult)NULL and no error occurs, is set an
 *            invalid handle value.
 *
 * @return  FRE_OK
 *          FRE_TYPE_MISMATCH
 *          FRE_INVALID_OBJECT
 *          FRE_INVALID_ARGUMENT
 *          FRE_ACTIONSCRIPT_ERROR If an ActionScript exception results from calling this method.
 *              In this case, thrownException will be set to the handle of the thrown value.
 *
 *          FRE_NO_SUCH_NAME If the named method doesn't exist, or if the reference is ambiguous
 *              because the method exists in more than one namespace.
 *
 *          FRE_ILLEGAL_STATE If a ByteArray or BitmapData has been acquired and not yet released.
 *
 *          FRE_WRONG_THREAD
 */

FREResult FRECallObjectMethod (
                               FREObject      object         ,
                               const uint8_t* methodName     ,
                               uint32_t       argc           ,
                               FREObject      argv[]         ,
                               FREObject*     result         ,
                               FREObject*     thrownException
                               ) {return (FREResult)NULL;}

/**
 * Referenced data is valid only for duration of the call
 * to a registered function.
 *
 * @return  FRE_OK
 *          FRE_TYPE_MISMATCH
 *          FRE_INVALID_OBJECT
 *          FRE_INVALID_ARGUMENT
 *          FRE_WRONG_THREAD
 *          FRE_ILLEGAL_STATE
 */

FREResult FREAcquireBitmapData(
                               FREObject      object         ,
                               FREBitmapData* descriptorToSet
                               ) {return (FREResult)NULL;}

/**
 * Referenced data is valid only for duration of the call
 * to a registered function.
 *
 * Use of this API requires that the extension and application must be packaged for
 * the 3.1 namespace or later.
 *
 * @return  FRE_OK
 *          FRE_TYPE_MISMATCH
 *          FRE_INVALID_OBJECT
 *          FRE_INVALID_ARGUMENT
 *          FRE_WRONG_THREAD
 *          FRE_ILLEGAL_STATE
 */

FREResult FREAcquireBitmapData2(
                                FREObject      object         ,
                                FREBitmapData2* descriptorToSet
                                ) {return (FREResult)NULL;}

/**
 * BitmapData must be acquired to call this. Clients must invalidate any region
 * they modify in order to notify AIR of the changes. Only invalidated regions
 * are redrawn.
 *
 * @return  FRE_OK
 *          FRE_INVALID_OBJECT
 *          FRE_WRONG_THREAD
 *          FRE_ILLEGAL_STATE
 *          FRE_TYPE_MISMATCH
 */

FREResult FREInvalidateBitmapDataRect(
                                      FREObject object,
                                      uint32_t x      ,
                                      uint32_t y      ,
                                      uint32_t width  ,
                                      uint32_t height
                                      ) {return (FREResult)NULL;}
/**
 * @return  FRE_OK
 *          FRE_WRONG_THREAD
 *          FRE_ILLEGAL_STATE
 *          FRE_TYPE_MISMATCH
 */

FREResult FREReleaseBitmapData( FREObject object ) {return (FREResult)NULL;}

/**
 * Referenced data is valid only for duration of the call
 * to a registered function.
 *
 * @return  FRE_OK
 *          FRE_TYPE_MISMATCH
 *          FRE_INVALID_OBJECT
 *          FRE_WRONG_THREAD
 */


FREResult FREAcquireByteArray(
                              FREObject     object        ,
                              FREByteArray* byteArrayToSet
                              ) {return (FREResult)NULL;}

/**
 * @return  FRE_OK
 *          FRE_INVALID_OBJECT
 *          FRE_ILLEGAL_STATE
 *          FRE_WRONG_THREAD
 */

FREResult FREReleaseByteArray( FREObject object ) {return (FREResult)NULL;}

/* Array and Vector Access ****************************************************/

/**
 * @return  FRE_OK
 *          FRE_INVALID_OBJECT
 *          FRE_INVALID_ARGUMENT
 *          FRE_ILLEGAL_STATE
 *          FRE_TYPE_MISMATCH
 *          FRE_WRONG_THREAD
 */

FREResult FREGetArrayLength(
                            FREObject  arrayOrVector,
                            uint32_t*  length
                            ) {return (FREResult)NULL;}

/**
 * @return  FRE_OK
 *          FRE_INVALID_OBJECT
 *          FRE_TYPE_MISMATCH
 *          FRE_ILLEGAL_STATE
 *          FRE_INVALID_ARGUMENT If length is greater than 2^32.
 *
 *          FRE_READ_ONLY   If the handle refers to a Vector
 *              of fixed size.
 *
 *          FRE_WRONG_THREAD
 *          FRE_INSUFFICIENT_MEMORY
 */

FREResult FRESetArrayLength(
                            FREObject  arrayOrVector,
                            uint32_t   length
                            ) {return (FREResult)NULL;}

/**
 * If an Array is sparse and an element that isn't defined is requested, the
 * return value will be FRE_OK but the handle value will be invalid.
 *
 * @return  FRE_OK
 *          FRE_ILLEGAL_STATE
 *
 *          FRE_INVALID_ARGUMENT If the handle refers to a vector and the index is
 *              greater than the size of the array.
 *
 *          FRE_INVALID_OBJECT
 *          FRE_TYPE_MISMATCH
 *          FRE_WRONG_THREAD
 */

FREResult FREGetArrayElementAt(
                               FREObject  arrayOrVector,
                               uint32_t   index        ,
                               FREObject* value
                               ) {return (FREResult)NULL;}

/**
 *
 * @return  FRE_OK
 *          FRE_INVALID_OBJECT
 *          FRE_ILLEGAL_STATE
 *
 *          FRE_TYPE_MISMATCH If an attempt to made to set a value in a Vector
 *              when the type of the value doesn't match the Vector's item type.
 *
 *          FRE_WRONG_THREAD
 */

FREResult FRESetArrayElementAt(
                               FREObject  arrayOrVector,
                               uint32_t   index        ,
                               FREObject  value
                               ) {return (FREResult)NULL;}

/* Callbacks ******************************************************************/

/**
 * Causes a StatusEvent to be dispatched from the associated
 * ExtensionContext object.
 *
 * Dispatch happens asynchronously, even if this is called during
 * a call to a registered function.
 *
 * The ActionScript portion of this extension can listen for that event
 * and, upon receipt, query the native portion for details of the event
 * that occurred.
 *
 * This call is thread-safe and may be invoked from any thread. The string
 * values are copied before the call returns.
 *
 * @return  FRE_OK In all circumstances, as the referenced object cannot
 *              necessarily be checked for validity on the invoking thread.
 *              However, no event will be dispatched if the object is
 *              invalid or not an EventDispatcher.
 *          FRE_INVALID_ARGUMENT If code or level is (FREResult)NULL
 */

FREResult FREDispatchStatusEventAsync(
                                      FREContext     ctx  ,
                                      const uint8_t* code ,
                                      const uint8_t* level
                                      ) {return (FREResult)NULL;}
