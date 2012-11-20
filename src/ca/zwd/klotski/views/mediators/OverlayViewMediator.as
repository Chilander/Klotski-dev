package ca.zwd.klotski.views.mediators 
{
	import ca.zwd.klotski.events.GameEvent;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.views.Block;
	import ca.zwd.klotski.views.OverlayView;
	import flash.events.MouseEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class OverlayViewMediator extends Mediator 
	{
		[Inject]
		public var game:Game;
		
		[Inject]
		public var overlayView:OverlayView
		
		override public function onRegister():void
		{
			overlayView.addEventListener(MouseEvent.CLICK, _onAvailableClicked);
			
			eventMap.mapListener(eventDispatcher, GameEvent.MOVE_CALCULATED, _onMoveCalculated);
			eventMap.mapListener(eventDispatcher, GameEvent.MOVE_COMPLETED, _onMoveCompleted);
		}
		
		private function _onMoveCalculated(event:GameEvent):void
		{
			overlayView.highlight(game.availableMoves);
		}
		
		private function _onMoveCompleted(event:GameEvent):void
		{
			overlayView.unHighlightAll();
		}
		
		private function _onAvailableClicked(event:MouseEvent):void
		{
			var block:Block = event.target as Block;
			if (!block) return;
			var e:GameEvent = new GameEvent(GameEvent.MOVE_BLOCK);
			e.reference = block.reference;
			dispatch(e);
		}
	}
}