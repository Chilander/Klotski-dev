package 
{
	import ca.zwd.klotski.KlotskiContext;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class Main extends Sprite 
	{
		private var context:KlotskiContext;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			context = new KlotskiContext(this);
		}
		
	}
	
}