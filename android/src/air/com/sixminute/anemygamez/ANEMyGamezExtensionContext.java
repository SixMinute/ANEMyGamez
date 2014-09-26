package air.com.sixminute.anemygamez;

import java.util.HashMap;
import java.util.Map;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;

public class ANEMyGamezExtensionContext extends FREContext
{
	public static final String INITIALISE 		= "initialise";
	public static final String DO_BILLING 		= "doBilling";
	public static final String VIEW_MORE_GAMES	= "viewMoreGames";
	public static final String DO_SOUND 		= "doSound";
	public static final String EXIT_GAME 		= "exitGame";
	
    public ANEMyGamezExtensionContext()
    {
    	ANEMyGamezExtension.DLog("MyGamesContext<constructor>");
    }
	
	@Override
	public void dispose() {
    	ANEMyGamezExtension.DLog("MyGamesContext.dispose");
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		ANEMyGamezExtension.DLog("MyGamesContext.getFunctions");
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();

		functionMap.put( INITIALISE, new Initialise() );
		
		return functionMap;
	}
	
	private static double DoubleFromFREArray(FREObject[] freArray, int index)
	{
		double returnDouble = 0;
		
		try
		{
			returnDouble = freArray[index].getAsDouble();
		} catch (IllegalStateException e) {
			Log.e("ANEAnalyticsExtensionContext", "DoubleFromFREArray ", e);
		} catch (FRETypeMismatchException e) {
			Log.e("ANEAnalyticsExtensionContext", "DoubleFromFREArray ", e);
		} catch (FREInvalidObjectException e) {
			Log.e("ANEAnalyticsExtensionContext", "DoubleFromFREArray ", e);
		} catch (FREWrongThreadException e) {
			Log.e("ANEAnalyticsExtensionContext", "DoubleFromFREArray ", e);
		}
		
		return returnDouble;
	}
	
	private static boolean BooleanFromFREArray(FREObject[] freArray, int index)
	{
		boolean returnBool = false;
		
		try
		{
			returnBool = freArray[index].getAsBool();
		} catch (IllegalStateException e) {
			Log.e("ANEAnalyticsExtensionContext", "StringFromFREArray ", e);
		} catch (FRETypeMismatchException e) {
			Log.e("ANEAnalyticsExtensionContext", "StringFromFREArray ", e);
		} catch (FREInvalidObjectException e) {
			Log.e("ANEAnalyticsExtensionContext", "StringFromFREArray ", e);
		} catch (FREWrongThreadException e) {
			Log.e("ANEAnalyticsExtensionContext", "StringFromFREArray ", e);
		}
		
		return returnBool;
	}
	
	private static boolean BooleanFromFREArray(FREObject[] freArray)
	{
		return BooleanFromFREArray(freArray, 0);
	}
	
	private static String StringFromFREArray(FREObject[] freArray, int index)
	{
		String returnString = null;
		
		try
		{
			returnString = freArray[index].getAsString();
		} catch (IllegalStateException e) {
			Log.e("ANEAnalyticsExtensionContext", "StringFromFREArray ", e);
		} catch (FRETypeMismatchException e) {
			Log.e("ANEAnalyticsExtensionContext", "StringFromFREArray ", e);
		} catch (FREInvalidObjectException e) {
			Log.e("ANEAnalyticsExtensionContext", "StringFromFREArray ", e);
		} catch (FREWrongThreadException e) {
			Log.e("ANEAnalyticsExtensionContext", "StringFromFREArray ", e);
		}
		
		return returnString;
	}
	
	private static String StringFromFREArray(FREObject[] freArray)
	{
		return StringFromFREArray(freArray, 0);
	}

	private static class FREFunctionImplementation implements FREFunction{
		protected FREObject returnObject = null;
		
		@Override
		public final FREObject call(FREContext context, FREObject[] args) {
			innerCall(context, args);
			return returnObject;
		}
		
		protected void innerCall(FREContext context, FREObject[] args) { }
	}
	
	public static class Initialise extends FREFunctionImplementation
	{
		@Override
		public void innerCall(FREContext context, FREObject[] args) {
			ANEMyGamezExtension.DLog("MyGamesContext.Initialise");
			
			StaticFunctions.Initialise( context.getActivity() );
		}
    }
	
	public static class DoBilling extends FREFunctionImplementation
	{
		@Override
		public void innerCall(FREContext context, FREObject[] args) {
			ANEMyGamezExtension.DLog("MyGamesContext.DoBilling");
			
			StaticFunctions.DoBilling(
				context.getActivity(),
				StringFromFREArray(args),
				BooleanFromFREArray(args, 1)
			);
		}
	}
	
	public static class ViewMoreGames extends FREFunctionImplementation
	{
		@Override
		public void innerCall(FREContext context, FREObject[] args) {
			ANEMyGamezExtension.DLog("MyGamesContext.ViewMoreGames");
			
			StaticFunctions.ViewMoreGames( context.getActivity() );
		}
	}
	
	public static class DoSound extends FREFunctionImplementation
	{
		@Override
		public void innerCall(FREContext context, FREObject[] args) {
			ANEMyGamezExtension.DLog("MyGamesContext.DoSound");
			
			StaticFunctions.DoSound( context.getActivity() );
		}
	}
	
	public static class ExitGame extends FREFunctionImplementation
	{
		@Override
		public void innerCall(FREContext context, FREObject[] args) {
			ANEMyGamezExtension.DLog("MyGamesContext.ExitGame");
			
			StaticFunctions.ExitGame( context.getActivity() );
		}
	}
}
