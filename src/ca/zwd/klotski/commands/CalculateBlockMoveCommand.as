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
			
			/*
			var spaces:Object = _getPossibleSpaces(position, size);
			
			var available:Array = [];
			for each(var side:Array in spaces)
			{
				if (_checkAvailability(side)) available.push(side);
			}
			*/
			
			//Marche pas !!!
			
			trace("hahaha");
			
		}
		/*
		private function _checkAvailability(side:Array):Boolean
		{
			for(var id:String in game.positions)
			{
				var size:Array = _getBlockVO(id).size.split(",");
				var columnA:int = game.positions[id].split(",")[0];
				var rowA:int = game.positions[id].split(",")[1];
				var columnB:int = columnA + size[0];
				var rowB:int = rowA + size[0];
				for each(var space:Array in side)
				{
					if (space[0] >= columnA && space[0] <= columnB && space[1] >= rowA && space[1] <= rowB) return false;
				}
			}
			return true;
		}
		private function _getPossibleSpaces(position:Vector.<int>, size:Vector.<int>):Object
		{
			var spaces:Object = {};
			var i:uint;
			
			//top
			spaces.top = [];
			for (i = 0; i < size[0]; i++)
			{
				spaces.top.push([position[0] + i, position[1] - 1]); 
			}
			//bottom
			spaces.bottom = [];
			for (i = 0; i < size[0]; i++)
			{
				spaces.bottom.push([position[0] + i, position[1] + size[1]]); 
			}
			//left
			spaces.left = [];
			for (i = 0; i < size[1]; i++)
			{
				spaces.left.push([position[0] - 1, position[1] + i]); 
			}
			//right
			spaces.right = [];
			for (i = 0; i < size[1]; i++)
			{
				spaces.right.push([position[0] + size[0], position[1] + i]); 
			}
			
			return spaces;
		}
		*/
	}
}