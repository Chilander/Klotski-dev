package ca.zwd.klotski.views.mediators 
{
	import ca.zwd.klotski.events.GameEvent;
	import ca.zwd.klotski.factories.BlockFactory;
	import ca.zwd.klotski.model.BlockVO;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Statics;
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
		
		[Inject]
		public var statics:Statics;
		
		[Inject]
		public var factory:BlockFactory;
		
		override public function onRegister():void
		{
			blocksView.addEventListener(MouseEvent.CLICK, _onBlockClicked);
			
			eventMap.mapListener(eventDispatcher, GameEvent.MOVE_CALCULATED, _onMoveCalculated);
			eventMap.mapListener(eventDispatcher, GameEvent.MOVE_COMPLETED, _onMoveCompleted);
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
		
		private function _onMoveCompleted(event:GameEvent):void
		{
			for (var j:int = blocksView.numChildren - 1; j >= 0; j--)
			{
				blocksView.removeChildAt(j);
			}
			
			for (var i:int = 0; i < statics.blocks.length; i++)
			{
				var blockVO:BlockVO = statics.blocks[i];
				blocksView.addBlock(factory.getBlock(blockVO));
			}
		}
		
		private function _onMoveCalculated(event:GameEvent):void
		{
			trace("hohoho");
		}
	}
}