package ca.zwd.klotski.views.mediators 
{
	import ca.zwd.klotski.events.GameEvent;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.views.OverlayView;
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
			eventMap.mapListener(eventDispatcher, GameEvent.MOVE_CALCULATED, _onMoveCalculated);
		}
		
		private function _onMoveCalculated(event:GameEvent):void
		{
			overlayView.highlight(game.availableMoves);
		}
	}
}