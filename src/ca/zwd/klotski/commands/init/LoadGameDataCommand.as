package ca.zwd.klotski.commands.init 
{
	import ca.zwd.klotski.events.InitEvent;
	import ca.zwd.klotski.model.BlockVO;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Statics;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class LoadGameDataCommand extends Command 
	{
		[Inject]
		public var game:Game;
		[Inject]
		public var statics:Statics;
		
		private var _loader:URLLoader;
		
		override public function execute():void
		{
			_loader = new URLLoader();
			_loader.addEventListener(Event.COMPLETE, _onCompleted);
			
			_loader.load(new URLRequest("data/game.xml"));
		}
		
		private function _onCompleted(event:Event):void
		{
			var data:XML = XML(_loader.data);
			
			statics.board = data.setup.board;
			statics.blockSize = data.setup.blockSize;
			statics.blockPadding = data.setup.blockPadding;
			
			for each(var blockData:XML in data.blocks.block)
			{
				var block:BlockVO = new BlockVO();
				block.id = blockData.attribute("id");
				block.name = blockData.attribute("name");
				block.size = blockData.attribute("size");
				block.asset = blockData.attribute("asset");
				
				statics.blocks.push(block);
			}
			
			for each(var positionData:XML in data.originalPositions.block)
			{
				game.positions[String(positionData.attribute("id"))] = positionData.attribute("position");
			}
			
			dispatch(new InitEvent(InitEvent.GAME_DATA_LOADED));
		}
	}
}