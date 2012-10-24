package ca.zwd.klotski.commands.init 
{
	import ca.zwd.klotski.model.BlockVO;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Statics;
	import ca.zwd.klotski.views.BackgroundView;
	import ca.zwd.klotski.views.Block;
	import ca.zwd.klotski.views.BlocksView;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class CreateGameViewCommand extends Command 
	{
		[Inject]
		public var game:Game;
		
		[Inject]
		public var statics:Statics;
		
		[Inject(name = "backgrounLayer")]
		public var backgroundLayer:Sprite;
		
		[Inject(name = "blockLayer")]
		public var blockLayer:Sprite
		
		override public function execute():void
		{
			_createBackgroundView();
			_createBlocksView();
		}
		
		private function _createBackgroundView():void
		{
			var background:BackgroundView = injector.instantiate(BackgroundView);
			backgroundLayer.addChild(background);
			
			var column:uint = statics.board.a;
			var row:uint = statics.board.b;
			
			var x:int = 0;
			var y:int = 0;
			var width:uint = statics.blockSize * column;
			var heigth:uint = statics.blockSize * row;
			
			background.drawBackground(x, y, width, heigth, 0xFF0000, 1);
		}
		
		private function _createBlocksView():void
		{
			var blocksView:BlocksView = injector.instantiate(BlocksView);
			blockLayer.addChild(blocksView);
			
			for (var i:int = 0; i < statics.blocks.length; i++)
			{
				var blockVO:BlockVO = statics.blocks[i];
				var column:uint = uint(game.positions[blockVO.id].a);
				var row:uint = uint(game.positions[blockVO.id].b);
				
				var x:int = column * statics.blockSize;
				var y:int = row * statics.blockSize;
				var width:uint = statics.blockSize * uint(blockVO.size.a);
				var height:uint = statics.blockSize * uint(blockVO.size.b);
				
				var block:Block = new Block();
				block.reference = blockVO.id;
				block.draw(width, height, Math.round(Math.random() * 0xFFFFFF), 1);
				block.label = blockVO.name.toUpperCase();
				
				blocksView.addBlock(block);
				block.x = x;
				block.y = y;
			}
		}
	}
}