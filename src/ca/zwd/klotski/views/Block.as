package ca.zwd.klotski.views
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class Block extends Sprite
	{
		public var reference:*;
		
		private var _label:TextField;
		
		public function Block()
		{
			_label = new TextField();
			_label.selectable = false;
			_label.mouseEnabled = false;
			_label.defaultTextFormat = new TextFormat("Arial", 12, 0x000000, true);
			addChild(_label);
		}
		
		public function draw(width:uint, height:uint, color:uint, alpha:Number):void
		{
			this.graphics.lineStyle(0, 0x000000, 1);
			this.graphics.drawRect(0, 0, width, height);
			this.graphics.beginFill(color, alpha);
			this.graphics.drawRect(0, 0, width, height);
			this.graphics.endFill();
		}
		
		public function get label():String 
		{
			return _label.text;
		}
		
		public function set label(value:String):void 
		{
			_label.text = value;
		}
	}
}