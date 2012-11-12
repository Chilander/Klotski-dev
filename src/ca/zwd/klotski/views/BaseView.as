package ca.zwd.klotski.views 
{
	import ca.zwd.klotski.model.Pair;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class BaseView extends Sprite
	{
		private var _dimension:Pair;
		private var _blockSize:int;
		
		
		public function BaseView() 
		{
			
		}
		
		public function get dimension():Pair 
		{
			return _dimension;
		}
		
		public function set dimension(value:Pair):void 
		{
			_dimension = value;
		}
		
		public function get blockSize():int 
		{
			return _blockSize;
		}
		
		public function set blockSize(value:int):void 
		{
			_blockSize = value;
		}
		
	}

}