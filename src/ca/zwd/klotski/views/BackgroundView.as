package ca.zwd.klotski.views 
{
	import ca.zwd.klotski.model.Pair;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class BackgroundView extends BaseView 
	{
		
		public function BackgroundView() 
		{
		}
		
		public function drawBackground(x:int, y:int, width:int, height:int, color:uint, alpha:Number):void
		{
			this.graphics.beginFill(color, alpha);
			this.graphics.drawRect(x, y, width, height);
			this.graphics.endFill();
		}
	}
}