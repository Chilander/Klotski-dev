package ca.zwd.klotski.commands 
{
	import ca.zwd.klotski.events.GameEvent;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Pair;
	import ca.zwd.klotski.model.Statics;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class MoveBlockCommand extends Command 
	{
		[Inject]
		public var event:GameEvent;
		
		[Inject]
		public var game:Game;
		
		[Inject]
		public var statics:Statics;
		
		override public function execute():void
		{
			var position:Pair = event.reference;
			
			game.positions[game.currentSelectedBlockId] = position;
			
			for (var i:int = game.availableMoves.length - 1; i >= 0; i--)
			{
				delete game.availableMoves[i];
			}
			
			game.availableMoves = new Vector.<Pair>();
			
			for (var j:int = game.emptySpaces.length - 1; j >= 0; j--)
			{
				delete game.emptySpaces[j];
			}
			
			game.emptySpaces = new Vector.<Pair>();
			
			game.currentSelectedBlockId = "";
			
			dispatch(new GameEvent(GameEvent.MOVE_COMPLETED));
		}
	}
}