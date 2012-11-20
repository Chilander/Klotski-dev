package ca.zwd.klotski 
{
	import ca.zwd.klotski.commands.CalculateBlockMoveCommand;
	import ca.zwd.klotski.commands.CalculateEmptySpacesCommand;
	import ca.zwd.klotski.commands.InitCommand;
	import ca.zwd.klotski.commands.MoveBlockCommand;
	import ca.zwd.klotski.events.GameEvent;
	import ca.zwd.klotski.events.InitEvent;
	import ca.zwd.klotski.factories.BlockFactory;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.model.Statics;
	import ca.zwd.klotski.views.BackgroundView;
	import ca.zwd.klotski.views.BlocksView;
	import ca.zwd.klotski.views.mediators.BackgroundViewMediator;
	import ca.zwd.klotski.views.mediators.BlocksViewMediator;
	import ca.zwd.klotski.views.mediators.OverlayViewMediator;
	import ca.zwd.klotski.views.OverlayView;
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
		private var _overlayLayer:Sprite;
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
			_overlayLayer = new Sprite();
			_mouseLayer = new Sprite();
			
			contextView.addChild(_backgroundLayer);
			contextView.addChild(_blockLayer);
			contextView.addChild(_overlayLayer);
			contextView.addChild(_mouseLayer);
		}
		
		private function _mapInjections():void
		{
			injector.mapSingleton(Statics);
			injector.mapSingleton(Game);
			injector.mapSingleton(BlockFactory);
			
			injector.mapValue(Sprite, _backgroundLayer, "backgrounLayer");
			injector.mapValue(Sprite, _blockLayer, "blockLayer");
			injector.mapValue(Sprite, _overlayLayer, "overlayLayer");
			injector.mapValue(Sprite, _mouseLayer, "mouseLayer");
		}
		
		private function _mapCommands():void
		{
			commandMap.mapEvent(InitEvent.INIT, InitCommand, InitEvent, true);
			commandMap.mapEvent(GameEvent.BLOCK_CLICKED, CalculateBlockMoveCommand, GameEvent, false);
			commandMap.mapEvent(GameEvent.MOVE_BLOCK, MoveBlockCommand, GameEvent, false);
			commandMap.mapEvent(GameEvent.MOVE_COMPLETED, CalculateEmptySpacesCommand, GameEvent, false);
		}
		
		private function _mapMediators():void
		{
			mediatorMap.mapView(BackgroundView, BackgroundViewMediator);
			mediatorMap.mapView(BlocksView, BlocksViewMediator);
			mediatorMap.mapView(OverlayView, OverlayViewMediator);
		}
	}
}