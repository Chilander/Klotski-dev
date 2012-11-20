package ca.zwd.klotski.commands.init 
{
	import ca.zwd.klotski.factories.BlockFactory;
	import ca.zwd.klotski.model.BlockVO;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Pair;
	import ca.zwd.klotski.model.Statics;
	import ca.zwd.klotski.views.BackgroundView;
	import ca.zwd.klotski.views.Block;
	import ca.zwd.klotski.views.BlocksView;
	import ca.zwd.klotski.views.OverlayView;
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
		
		[Inject]
		public var factory:BlockFactory;
		
		[Inject(name = "backgrounLayer")]
		public var backgroundLayer:Sprite;
		
		[Inject(name = "blockLayer")]
		public var blockLayer:Sprite
		
		[Inject(name = "overlayLayer")]
		public var overlayLayer:Sprite
		
		override public function execute():void
		{
			_createBackgroundView();
			_createBlocksView();
			_createOverlayView();
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
			background.dimension = new Pair(column, row);
			background.blockSize = statics.blockSize;
		}
		
		private function _createBlocksView():void
		{
			var blocksView:BlocksView = injector.instantiate(BlocksView);
			blockLayer.addChild(blocksView);
			blocksView.dimension = new Pair(statics.board.a, statics.board.b);
			blocksView.blockSize = statics.blockSize;
			
			for (var i:int = 0; i < statics.blocks.length; i++)
			{
				var blockVO:BlockVO = statics.blocks[i];
				blocksView.addBlock(factory.getBlock(blockVO));
			}
		}
		
		private function _createOverlayView():void
		{
			var overlayView:OverlayView = injector.instantiate(OverlayView);
			overlayLayer.addChild(overlayView);
			overlayView.dimension = new Pair(statics.board.a, statics.board.b);
			overlayView.blockSize = statics.blockSize;
		}
	}
}