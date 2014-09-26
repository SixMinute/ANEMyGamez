package com.mygamez.demo;

import air.com.sixminute.anemygamez.R;
import android.app.ListActivity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.view.Display;
import android.view.KeyEvent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.AdapterView.OnItemClickListener;

import com.mygamez.billing.BillingResult;
import com.mygamez.billing.Consts;
import com.mygamez.billing.IChinaBillingExitCallBack;
import com.mygamez.billing.IChinaBillingListener;
import com.mygamez.billing.IChinaBillingLoginCallback;
import com.mygamez.billing.ChinaBillingPayCallback;
import com.mygamez.billing.MyBilling;
import com.mygamez.exceptions.NotInChinaBillingSDKException;
import com.mygamez.services.AutoUpdate;
import com.mygamez.services.utils;

public class MyActivity extends ListActivity {
	  static final String[] BUTTONS = new String[]{
	    "00.Billing Point 001",
	    "01.Billing Point 002",
	    "02.Billing Point 003",
	    "03.Billing Point 004",
	    "04.Billing Point 005",
	    "05.Billing Point 006",
	    "06.Billing Point 007",
	    "07.Billing Point 008",
	    "08.Billing Point 009",
	    "09.Billing Point 010",
	    "10.Billing Point 011",
	    "11.Billing Point 012",
	    "12.Billing Point 013",
	    "13.Billing Point 014",
	    "14.Billing Point 015",
	    "15.Billing Point 016",
	    "05.More Games",
	    "06.Sound On/Off",
	    "07.Get channel ID",
	    "08.ScreenShot Share",
	    "09.Exit Game"
	  };

	  // MyGamez AutoUpdater
	  AutoUpdate updr = new AutoUpdate();

	  /**
	   * Called when the activity is first created.
	   */
	  @Override
	  public void onCreate(Bundle savedInstanceState) {
	    super.onCreate(savedInstanceState);

	    // Initialize MyGamez Billing SDK (testing environment)
	    MyBilling.initializeApp(this, true);
	    
	    // Initialize MyGamez Billing SDK (production environment)
//	    MyBilling.initializeApp(this, false);
	    
	    // Try to create a login listener. Only CMCC supports login.
	    try {
			MyBilling.setLoginListener(this, new IChinaBillingLoginCallback() {  
			    @Override
			    public void onResult(int i, String s, Object o) {
			      System.out.println("Login.Result=" + s);
			      if(i == Consts.LOGIN_SUCCESS_EXPLICIT || i == Consts.LOGIN_SUCCESS_IMPLICIT){
			      	Toast.makeText(MyActivity.this, "Login Successful", Toast.LENGTH_SHORT).show();

			      }
			      if(i == Consts.LOGIN_FAILED_EXPLICIT || i == Consts.LOGIN_FAILED_IMPLICIT){
			      	Toast.makeText(MyActivity.this, "Login Failed", Toast.LENGTH_SHORT).show();
			      }
			      if(i == Consts.LOGIN_UNKOWN){
			      	Toast.makeText(MyActivity.this, "No Login", Toast.LENGTH_SHORT).show();
			      }
			    }
			  });
		} catch (NotInChinaBillingSDKException e) {
			Log.e("MyBillingDemo", e.getMessage());
			e.printStackTrace();
		}

	    
	    // Create listener that will be called after receiving billing result
	    final IChinaBillingListener listener = new IChinaBillingListener() {
			
			@Override
			public void onChinaBillingResult(final BillingResult result) {
				Log.i("MyBillingDemo", result.toString());
				String output;
		          switch (result.getResultCode()) 
		          {
		            case BillingResult.BILLING_RESULT_SUCCESS:
		            	output = "Purchase item [" + result.getBillingIndex() + "] ok!";
		              break;
		            case BillingResult.BILLING_RESULT_FAILED:
		            	output = "Purchase item [" + result.getBillingIndex() + "] failed!";
		              break;
		            default:
		            	output = "Purchase item [" + result.getBillingIndex() + "] canceled!";
		              break;
		          }
		          Toast.makeText(MyActivity.this, output, Toast.LENGTH_SHORT).show();
			}
		};		
		// Create actual callback for billing
	    final ChinaBillingPayCallback payCallback = new ChinaBillingPayCallback(listener);


	    setListAdapter(new ArrayAdapter<String>(this, R.layout.main_menu_item, BUTTONS));
	    ListView lv = getListView();
		lv.setOnItemClickListener(new OnItemClickListener() {
		public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
			// Billing points
			if (16 > position) {
				String billingIndex =  getBillingIndex(position);
				System.out.println("billing index=" + billingIndex);
				// Repeating billing points are meaningful only if com.mygamez.billing.Consts.ACTUAL_BILLING_PROVIDER is "CMCC" 
				boolean isRepeated = true;// !"001".equals(billingIndex);
				MyBilling.doBilling(MyActivity.this, true, isRepeated, billingIndex, payCallback);   
			} 
			// More games
			else if (16 == position) {
				MyBilling.viewMoreGames(MyActivity.this);
			} 
			// Did user set sound on, off or unknown in OpeningAnimation  
			else if (17 == position) {
				Toast.makeText(MyActivity.this, "Sound On/Off: " + MyBilling.isMusicEnabled(), Toast.LENGTH_SHORT).show();
			} 
			// Gets the channel id that is set in AndroidManifest.xml
			else if (18 == position) {
				Toast.makeText(MyActivity.this, utils.GetChannelID(getApplicationContext()), Toast.LENGTH_SHORT).show();
			}
			// Shares Screen Shot
			else if (19 == position) {
				Bitmap bm = loadBitmapFromView(MyActivity.this.getListView());
				utils.SharePictureAndText(MyActivity.this, "share.png", "我的游戏截图：", bm);          
			} 
			// Exits the game
			else if (20 == position){
				try {
					MyBilling.exit(MyActivity.this);
				} catch (NotInChinaBillingSDKException e) {
					Log.e("MyBillingDemo", e.getMessage());
					e.printStackTrace();
				}
			}
			// Unimplemented
			else {
				Toast.makeText(MyActivity.this, "Unimplemented onItemClick. Position="+position, Toast.LENGTH_SHORT).show();
			}
		}
		});
	    
		// Checks for game update
	    updr.onCreate(getApplication(), R.layout.activity_gameservice, "company name", "game name", "apk name", 1.0f);
	    
	    // Sends activation message to statistics server
	    utils.Activate(getApplicationContext(), "MyGamez", "MySDK_CMCC_20017");
	        
	  }
	  
	  private String getBillingIndex(int i) {
		    if (i < 9) {
		      return "00" + (++i);
		    } else {
		      return "0" + (++i);
		    }
		  }  
	  
	  /*
	   * NOTE: Change this function to capture screen shot from your game
	   */
	  public Bitmap loadBitmapFromView(View v) {
		  
		  	Display dm = this.getWindowManager().getDefaultDisplay();
		  
		    Bitmap returnedBitmap = Bitmap.createBitmap(dm.getWidth(), dm.getHeight(),Bitmap.Config.ARGB_8888);
		    Canvas canvas = new Canvas(returnedBitmap);
		    Drawable bgDrawable =v.getBackground();
		    if (bgDrawable!=null) 
		        bgDrawable.draw(canvas);
		    else 
		        canvas.drawColor(Color.WHITE);
		    v.draw(canvas);
		    return returnedBitmap;
	  } 

	  @Override
	  public void onResume() {
	    super.onResume();
	  }

	  /**
	   * leave game 
	   */
	  private void exitGame() {
		  try {
			MyBilling.exitApp();
		} catch (NotInChinaBillingSDKException e) {
			Log.e("MyBillingDemo", e.getMessage());
			e.printStackTrace();
		}
	  }
	  
	  
	  private void exitGameWithCallBack() throws NotInChinaBillingSDKException {
		  MyBilling.exit(this, new IChinaBillingExitCallBack() {
		      @Override
		      public void onConfirmExit() {
		        MyActivity.this.finish();
		        System.exit(0);
		      }

		      @Override
		      public void onCancelExit() {
		        Toast.makeText(MyActivity.this, "Exit cancelled", Toast.LENGTH_SHORT).show();
		      }
		    });
		  }
	  

	  @Override
	  public boolean onKeyDown(int keyCode, KeyEvent event) {
	    if (keyCode == KeyEvent.KEYCODE_BACK) {
	      //exitGame();
	    	try {
				exitGameWithCallBack();
			} catch (NotInChinaBillingSDKException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	      return true;
	    }
	    return super.onKeyDown(keyCode, event);
	  }
}
