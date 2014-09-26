package com.sixminute.ane
{
	import flash.events.EventDispatcher;

	public class SuperANEMyGamez extends EventDispatcher
	{
		protected static const INITIALISE:String		= 'initialise';
		protected static const DO_BILLING:String		= "doBilling";
		protected static const VIEW_MORE_GAMES:String	= "viewMoreGames";
		protected static const DO_SOUND:String 			= "doSound";
		protected static const EXIT_GAME:String 		= "exitGame";
		
		public function SuperANEMyGamez(enf:Object)
		{
			if(null == enf)
			{
				throw Error(String(this) + ' is a singleton, use getInstance(), do not call the constructor directly.');
			}
		}
		
		// public static void Initialise(final Activity activity)
		public function initialise():void { }
		
		// public static void DoBilling(Context context, String index, boolean isRepeated)
		public function doBilling(index:String, isRepeated:Boolean):void { }
		
		// public static void ViewMoreGames(Context context)
		public function viewMoreGames():void { }
		
		// public static void DoSound(Context context)
		public function doSound():void { }
		
		// public static void ExitGame(Context context)
		public function exitGame():void { }
	}
}
