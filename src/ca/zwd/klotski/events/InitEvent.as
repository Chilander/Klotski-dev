package ca.zwd.klotski.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class InitEvent extends Event 
	{
		public static const INIT:String = "InitEvent_INIT";
		public static const START:String = "InitEvent_START";
		public static const FINISH:String = "InitEvent_FINISH";
		
		public static const GAME_DATA_LOADED:String = "InitEvent_GAME_DATA_LOADED";
		
		public function InitEvent(type:String, bubble:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubble, cancelable);
		}
		
	}

}