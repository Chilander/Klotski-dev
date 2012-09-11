package ca.zwd.klotski.model 
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class Game 
	{
		private var _positions:Dictionary;
		
		public function Game() 
		{
			
		}
		
		public function get positions():Dictionary 
		{
			return _positions || (_positions = new Dictionary());
		}
		
		public function set positions(value:Dictionary):void 
		{
			_positions = value;
		}
		
	}

}