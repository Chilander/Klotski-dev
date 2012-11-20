package ca.zwd.klotski.views 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class BlocksView extends BaseView 
	{
		public function addBlock(block:Block):void
		{
			addChild(block);
		}
	}

}