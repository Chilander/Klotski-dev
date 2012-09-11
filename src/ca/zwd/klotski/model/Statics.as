package ca.zwd.klotski.model 
{
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class Statics 
	{
		private var _blocks:Vector.<BlockVO>;
		private var _board:String;
		private var _blockSize:int;
		private var _blockPadding:int;
		
		public function Statics() 
		{
			
		}
		
		public function get blocks():Vector.<BlockVO> 
		{
			return _blocks || (_blocks = new Vector.<BlockVO>);
		}
		
		public function get board():String 
		{
			return _board;
		}
		
		public function set board(value:String):void 
		{
			_board = value;
		}
		
		public function get blockSize():int 
		{
			return _blockSize;
		}
		
		public function set blockSize(value:int):void 
		{
			_blockSize = value;
		}
		
		public function get blockPadding():int 
		{
			return _blockPadding;
		}
		
		public function set blockPadding(value:int):void 
		{
			_blockPadding = value;
		}
	}
}