package com.mygamez.demo;

import android.app.Application;

public class MyApplication extends Application {
	public void onCreate() {
		System.loadLibrary("megjb");
	}
}
