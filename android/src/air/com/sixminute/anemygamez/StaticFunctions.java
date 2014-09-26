package air.com.sixminute.anemygamez;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import com.mygamez.billing.Consts;
import com.mygamez.billing.IChinaBillingLoginCallback;
import com.mygamez.billing.MyBilling;
import com.mygamez.exceptions.NotInChinaBillingSDKException;
import com.mygamez.services.AutoUpdate;

public class StaticFunctions
{
	private static final String TAG = "ANEMyGamez:StaticFunctions.";

	// MyGamez AutoUpdater
	private AutoUpdate mUpdater = new AutoUpdate();
	
	public static void Initialise(final Activity activity)
	{
		Log.d(TAG, "Initialise");

		System.loadLibrary("megjb");

	    // Initialize MyGamez Billing SDK (testing environment)
	    MyBilling.initializeApp(activity, true);
	    
	    // Initialize MyGamez Billing SDK (production environment)
//	    MyBilling.initializeApp(this, false);
	    
	    // Try to create a login listener. Only CMCC supports login.
	    try {
			MyBilling.setLoginListener(activity, new IChinaBillingLoginCallback() {  
			    @Override
			    public void onResult(int i, String s, Object o) {
			      System.out.println("Login.Result=" + s);
			      if(i == Consts.LOGIN_SUCCESS_EXPLICIT || i == Consts.LOGIN_SUCCESS_IMPLICIT){
			      	Toast.makeText(activity, "Login Successful", Toast.LENGTH_SHORT).show();

			      }
			      if(i == Consts.LOGIN_FAILED_EXPLICIT || i == Consts.LOGIN_FAILED_IMPLICIT){
			      	Toast.makeText(activity, "Login Failed", Toast.LENGTH_SHORT).show();
			      }
			      if(i == Consts.LOGIN_UNKOWN){
			      	Toast.makeText(activity, "No Login", Toast.LENGTH_SHORT).show();
			      }
			    }
			  });
		} catch (NotInChinaBillingSDKException e) {
			Log.e("MyBillingDemo", e.getMessage());
			e.printStackTrace();
		}
	}
	
	public static void DoBilling(Context context, String index, boolean isRepeated)
	{
		MyBilling.doBilling(context, true, isRepeated, index, null);   
	}
	
	public static void ViewMoreGames(Context context)
	{
		MyBilling.viewMoreGames(context);
	}
	
	public static void DoSound(Context context)
	{
		Toast.makeText(context, "Sound On/Off: " + MyBilling.isMusicEnabled(), Toast.LENGTH_SHORT).show();
	}
	
	public static void ExitGame(Context context)
	{
		try {
			MyBilling.exit(context);
		} catch (NotInChinaBillingSDKException e) {
			Log.e("MyBillingDemo", e.getMessage());
			e.printStackTrace();
		}
	}
}
