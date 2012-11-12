package ca.zwd.klotski.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class GameEvent extends Event 
	{
		public static const BLOCK_CLICKED:String = "GameEvent_BLOCK_CLICKED";
		public static const MOVE_CALCULATED:String = "GameEvent_MOVE_CALCULATED";
		
		public var reference:*;
		
		public function GameEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}