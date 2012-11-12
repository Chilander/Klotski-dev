package ca.zwd.klotski.views.mediators 
{
	import ca.zwd.klotski.events.GameEvent;
	import ca.zwd.klotski.views.Block;
	import ca.zwd.klotski.views.BlocksView;
	import flash.events.MouseEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class BlocksViewMediator extends Mediator 
	{
		[Inject]
		public var blocksView:BlocksView;
		
		override public function onRegister():void
		{
			blocksView.addEventListener(MouseEvent.CLICK, _onBlockClicked);
			
			eventMap.mapListener(eventDispatcher, GameEvent.MOVE_CALCULATED, _onMoveCalculated);
		}
		
		override public function onRemove():void
		{
			
		}
		
		private function _onBlockClicked(event:MouseEvent):void
		{
			var block:Block = event.target as Block;
			if (!block) return;
			var e:GameEvent = new GameEvent(GameEvent.BLOCK_CLICKED);
			e.reference = block.reference;
			dispatch(e);
		}
		
		private function _onMoveCalculated(event:GameEvent):void
		{
			trace("hohoho");
		}
	}
}