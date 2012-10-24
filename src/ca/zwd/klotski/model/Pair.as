package ca.zwd.klotski.model 
{
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class Pair 
	{
		public var a:Number;
		public var b:Number;
		
		public function Pair(a:Number = 0, b:Number = 0 ) 
		{
			this.a = a;
			this.b = b;
		}
		
		public static function split(s:String, separator:String):Pair
		{
			return new Pair(s.split(separator)[0], s.split(separator)[1]);
		}
		
	}

}