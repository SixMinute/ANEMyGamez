package com.mygamez.splashscreen;

import air.com.sixminute.anemygamez.R;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

public class MySplashScreen extends Activity{
	
	// More details & source
	// http://www.androidhive.info/2013/07/how-to-implement-android-splash-screen-2/
	
	// Splash screen timer
    private static int SPLASH_TIME_OUT = 3000;
 
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.my_splash_activity);

        new Handler().postDelayed(new Runnable() {
 
            /*
             * Showing splash screen with a timer. This will be useful when you
             * want to show case your app logo / company
             */
 
            @Override
            public void run() {
                // This method will be executed once the timer is over
                // Start your app main activity
            	
                Intent i = new Intent(MySplashScreen.this, com.mygamez.demo.MyActivity.class);
                startActivity(i);
                // close this activity
                finish();
            }
        }, SPLASH_TIME_OUT);
    }

}
