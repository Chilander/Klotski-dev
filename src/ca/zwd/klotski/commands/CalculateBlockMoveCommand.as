package ca.zwd.klotski.commands 
{
	import ca.zwd.klotski.events.GameEvent;
	import ca.zwd.klotski.model.BlockVO;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Pair;
	import ca.zwd.klotski.model.Statics;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class CalculateBlockMoveCommand extends Command 
	{
		[Inject]
		public var gameEvent:GameEvent;
		
		[Inject]
		public var game:Game;
		
		[Inject]
		public var statics:Statics;
		
		override public function execute():void
		{
			var id:String = gameEvent.reference;
			
			var position:Pair = game.positions[id] as Pair;
			var size:Pair = statics.getBlockVO(id).size;
			var board:Pair = statics.board;
			
			var spaces:Object = _getSideSpaces(position, size);
			
			var possible:Vector.<Pair> = new Vector.<Pair>();
			for each(var side:Vector.<Pair> in spaces)
			{
				possible = possible.concat(_getPossibleSpaces(side, game.emptySpaces));
			}
			
			game.availableMoves = possible;
			game.currentSelectedBlockId = id;
			dispatch(new GameEvent(GameEvent.MOVE_CALCULATED));
		}
		
		private function _getPossibleSpaces(available:Vector.<Pair>, empty:Vector.<Pair>):Vector.<Pair>
		{
			var returned:Vector.<Pair> = new Vector.<Pair>();
			for each(var pair:Pair in available)
			{
				for each(var emptyPair:Pair in empty)
				{
					if (pair.a == emptyPair.a && pair.b == emptyPair.b) 
					{
						returned.push(pair);
					}
				}
			}
			return returned;
		}
		
		private function _getSideSpaces(position:Pair, size:Pair):Object
		{
			var spaces:Object = {};
			var i:uint;
			
			//top
			spaces.top = new Vector.<Pair>();
			for (i = 0; i < size.a; i++)
			{
				spaces.top.push(new Pair(position.a + i, position.b - 1)); 
			}
			//bottom
			spaces.bottom = new Vector.<Pair>();
			for (i = 0; i < size.a; i++)
			{
				spaces.bottom.push(new Pair(position.a + i, position.b + size.b)); 
			}
			//left
			spaces.left = new Vector.<Pair>();
			for (i = 0; i < size.b; i++)
			{
				spaces.left.push(new Pair(position.a - 1, position.b + i)); 
			}
			//right
			spaces.right = new Vector.<Pair>();
			for (i = 0; i < size.b; i++)
			{
				spaces.right.push(new Pair(position.a + size.a, position.b + i)); 
			}
			
			//if the piece is a square of 1 x 1, then we also includes corners
			if (size.a == 1 && size.b == 1) 
			{
				var corners:Vector.<Pair> = new Vector.<Pair>();
				if (position.a - 1 >= 0 && position.b - 1 >= 0) corners.push(new Pair(position.a - 1, position.b - 1));
				if (position.a + 1 >= 0 && position.b - 1 >= 0) corners.push(new Pair(position.a + 1, position.b - 1));
				if (position.a - 1 >= 0 && position.b + 1 >= 0) corners.push(new Pair(position.a - 1, position.b + 1));
				if (position.a + 1 >= 0 && position.b + 1 >= 0) corners.push(new Pair(position.a + 1, position.b + 1));
				spaces.corners = corners;
			}
			
			return spaces;
		}
	}
}