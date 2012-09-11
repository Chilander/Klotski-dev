package ca.zwd.klotski 
{
	import ca.zwd.klotski.commands.CalculateBlockMoveCommand;
	import ca.zwd.klotski.commands.InitCommand;
	import ca.zwd.klotski.events.GameEvent;
	import ca.zwd.klotski.events.InitEvent;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Statics;
	import ca.zwd.klotski.views.BackgroundView;
	import ca.zwd.klotski.views.BlocksView;
	import ca.zwd.klotski.views.mediators.BackgroundViewMediator;
	import ca.zwd.klotski.views.mediators.BlocksViewMediator;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import org.robotlegs.mvcs.Context;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class KlotskiContext extends Context 
	{
		private var _backgroundLayer:Sprite;
		private var _blockLayer:Sprite;
		private var _mouseLayer:Sprite;
		
		public function KlotskiContext(contextView:DisplayObjectContainer) 
		{
			super(contextView, true);
		}
		
		override public function startup():void
		{
			_createLayers();
			
			_mapInjections();
			_mapCommands();
			_mapMediators();
			
			dispatchEvent(new InitEvent(InitEvent.INIT));
		}
		
		private function _createLayers():void
		{
			_backgroundLayer = new Sprite();
			_blockLayer = new Sprite();
			_mouseLayer = new Sprite();
			
			contextView.addChild(_backgroundLayer);
			contextView.addChild(_blockLayer);
			contextView.addChild(_mouseLayer);
		}
		
		private function _mapInjections():void
		{
			injector.mapSingleton(Statics);
			injector.mapSingleton(Game);
			
			injector.mapValue(Sprite, _backgroundLayer, "backgrounLayer");
			injector.mapValue(Sprite, _blockLayer, "blockLayer");
			injector.mapValue(Sprite, _mouseLayer, "mouseLayer");
		}
		
		private function _mapCommands():void
		{
			commandMap.mapEvent(InitEvent.INIT, InitCommand, InitEvent, true);
			commandMap.mapEvent(GameEvent.BLOCK_CLICKED, CalculateBlockMoveCommand, GameEvent, false);
		}
		
		private function _mapMediators():void
		{
			mediatorMap.mapView(BackgroundView, BackgroundViewMediator);
			mediatorMap.mapView(BlocksView, BlocksViewMediator);
		}
	}
}