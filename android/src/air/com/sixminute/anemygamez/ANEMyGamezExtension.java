package air.com.sixminute.anemygamez;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class ANEMyGamezExtension implements FREExtension {

	private static ANEMyGamezExtensionContext sContext;

	/**
	 * Create the context (AS to Java).
	 */
	public FREContext createContext(String extId) {
		DLog("ANEAnalyticsExtension createContext extId: " + extId);
		
		sContext = new ANEMyGamezExtensionContext();
		return sContext;
	}

	/**
	 * Dispose the context.
	 */
	public void dispose() {
		DLog("ANEAnalyticsExtension dispose");
	}

	/**
	 * Initialize the context. Doesn't do anything for now.
	 */
	public void initialize() {
		DLog("ANEAnalyticsExtension initialize");
	}
	
	public static void DLog(String msg) {
		if(null != sContext)
		{
			sContext.dispatchStatusEventAsync("MESSAGE", msg);
		}
		Log.i("ANEAnalytics", msg);
	}
}
