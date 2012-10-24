package ca.zwd.klotski.model
{
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class BlockVO
	{
		private var _id:String;
		private var _size:Pair;
		private var _name:String;
		private var _asset:String;
		
		public function BlockVO()
		{
		
		}
		
		public function get id():String 
		{
			return _id;
		}
		
		public function set id(value:String):void 
		{
			_id = value;
		}
		
		public function get size():Pair
		{
			return _size;
		}
		
		public function set size(value:Pair):void
		{
			_size = value;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get asset():String
		{
			return _asset;
		}
		
		public function set asset(value:String):void
		{
			_asset = value;
		}
	}
}