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
		private var _emptySpaces:Vector.<Pair>
		
		public function Game() 
		{
			
		}
		
		public function get positions():Dictionary 
		{
			return _positions ||= new Dictionary();
		}
		
		public function get emptySpaces():Vector.<Pair>
		{
			return _emptySpaces ||= new Vector.<Pair>;
		}
	}
}