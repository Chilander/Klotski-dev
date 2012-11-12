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
		private var _emptySpaces:Vector.<Pair>;
		private var _availableMoves:Vector.<Pair>;
		
		public function Game() 
		{
			
		}
		
		public function get positions():Dictionary 
		{
			return _positions ||= new Dictionary();
		}
		
		public function set positions(value:Dictionary):void
		{
			_positions = value;
		}
		
		public function get emptySpaces():Vector.<Pair>
		{
			return _emptySpaces ||= new Vector.<Pair>;
		}
		
		public function set emptySpaces(value:Vector.<Pair>):void
		{
			_emptySpaces = value;
		}
		
		public function get availableMoves():Vector.<Pair> 
		{
			return _availableMoves;
		}
		
		public function set availableMoves(value:Vector.<Pair>):void 
		{
			_availableMoves = value;
		}
	}
}