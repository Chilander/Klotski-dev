package ca.zwd.klotski.views 
{
	import ca.zwd.klotski.model.Pair;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class OverlayView extends BaseView 
	{
		public static const HIGHLIGHTED_CLICKED:String = "OverlayView_HIGHLIGHTED_CLICKED";
		private var _highlighted:Vector.<Block>;
		
		public function OverlayView() 
		{
		}
		
		public function highlight(blocks:Vector.<Pair>):void
		{
			if (_highlighted && _highlighted.length) unHighlightAll();
			_highlighted = new Vector.<Block>();
			for each(var pair:Pair in blocks)
			{
				var block:Block = new Block();
				block.reference = pair;
				block.draw(blockSize, blockSize, 0xFFFFFF, 1);
				block.x = pair.a * blockSize;
				block.y = pair.b * blockSize;
				block.filters = [new GlowFilter(0xFFFFFF, 1, 10, 10, 2, BitmapFilterQuality.HIGH, false, false)];
				block.addEventListener(MouseEvent.CLICK, _onBlockClicked);
				addChild(block);
				_highlighted.push(block);
			}
		}
		
		public function unHighlightAll():void
		{
			for (var i:int = _highlighted.length - 1; i >= 0; i--)
			{
				var block:Block = _highlighted[i];
				block.removeEventListener(MouseEvent.CLICK, _onBlockClicked);
				removeChild(block);
				_highlighted.splice(i, 1);
			}
		}
		
		private function _onBlockClicked(event:MouseEvent):void
		{
			dispatchEvent(new Event(HIGHLIGHTED_CLICKED));
		}
	}
}