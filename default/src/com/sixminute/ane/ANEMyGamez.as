package com.sixminute.ane
{
	public class ANEMyGamez extends SuperANEMyGamez
	{
		private static var INSTANCE:ANEAnalytics;
		
		public function ANEMyGamez(enf:Enforcer)
		{
			super(enf as Enforcer);
		}
		
		public static function getInstance() : SuperANEMyGamez
		{
			return INSTANCE ||= new ANEMyGamez( new Enforcer() );
		}
	}
}

internal class Enforcer {}
