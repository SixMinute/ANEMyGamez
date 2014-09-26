package com.sixminute.ane
{
	import flash.external.ExtensionContext;

	public class ANEMyGamez extends SuperANEMyGamez
	{
		private static var INSTANCE:ANEMyGamez;
		
		private var extCtx:ExtensionContext = null;
		
		private var mDebugPrint:Boolean = false;
		
		public function ANEMyGamez(enf:Enforcer)
		{
			super(enf as Enforcer);
			
			extCtx = ExtensionContext.createExtensionContext('com.sixminute.ane.ANEAnalytics', null);

			if(null == extCtx)
			{
				trace(this, 'Error - Extension Context is null.');
			}
		}
		
		public static function getInstance() : SuperANEMyGamez
		{
			return INSTANCE ||= new ANEMyGamez( new Enforcer() );
		}
		
		override public function initialise():void
		{
			extCtx.call(INITIALISE);
		}
		
		override public function doBilling(index:String, isRepeated:Boolean):void
		{
			extCtx.call(DO_BILLING, index, isRepeated);
		}
		
		override public function viewMoreGames():void
		{
			extCtx.call(VIEW_MORE_GAMES);
		}
		
		override public function doSound():void
		{
			extCtx.call(DO_SOUND);
		}
		
		override public function exitGame():void
		{
			extCtx.call(EXIT_GAME);
		}
	}
}

internal class Enforcer {}
