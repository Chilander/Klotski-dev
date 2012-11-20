package ca.zwd.klotski.factories 
{
	import ca.zwd.klotski.model.BlockVO;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Statics;
	import ca.zwd.klotski.views.Block;
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class BlockFactory 
	{
		[Inject]
		public var statics:Statics;
		
		[Inject]
		public var game:Game;
		
		public function BlockFactory() 
		{
			
		}
		
		public function getBlock(vo:BlockVO):Block
		{
			var column:uint = uint(game.positions[vo.id].a);
			var row:uint = uint(game.positions[vo.id].b);
			
			var x:int = column * statics.blockSize;
			var y:int = row * statics.blockSize;
			var width:uint = statics.blockSize * uint(vo.size.a);
			var height:uint = statics.blockSize * uint(vo.size.b);
			
			var block:Block = new Block();
			block.reference = vo.id;
			block.draw(width, height, Math.round(Math.random() * 0xFFFFFF), 1);
			block.label = vo.name.toUpperCase();
			
			block.x = x;
			block.y = y;
			
			return block;
		}
		
	}

}