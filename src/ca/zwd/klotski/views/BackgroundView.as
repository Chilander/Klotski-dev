package ca.zwd.klotski.views 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class BackgroundView extends Sprite 
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