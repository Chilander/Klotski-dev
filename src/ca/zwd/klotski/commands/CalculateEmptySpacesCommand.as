package ca.zwd.klotski.commands 
{

	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Pair;
	import ca.zwd.klotski.model.Statics;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class CalculateEmptySpacesCommand extends Command 
	{
		[Inject]
		public var game:Game;
		
		[Inject]
		public var statics:Statics;
		
		override public function execute():void
		{
			var columns:Vector.<Vector.<Pair>> = new Vector.<Vector.<Pair>>();
			var row:Vector.<Pair>;
			
			var i:int; 
			var j:int;
			
			for (i = 0; i < statics.board.a; i++)
			{
				row = new Vector.<Pair>();
				for (j = 0; j < statics.board.b; j++)
				{
					row.push(new Pair(i, j));
				}
				columns.push(row);
			}
			
			for (var id:String in game.positions)
			{
				var position:Pair = game.positions[id] as Pair;
				var size:Pair = statics.getBlockVO(id).size;
				_remove(columns, position, size);
			}
			
			var count:int = 0;
			
			for (i = 0; i < columns.length; i++)
			{
				for (j = 0; j < row.length; j++)
				{
					if (columns[i][j]) game.emptySpaces[count++] = columns[i][j];
				}
			}
		}
		
		private function _remove(map:Vector.<Vector.<Pair>>, position:Pair, size:Pair):void
		{
			for (var i:int = 0; i < size.a; i++)
			{
				for (var j:int = 0; j < size.b; j++)
				{
					map[position.a + i][position.b + j] = null;
				}
			}
		}
	}
}