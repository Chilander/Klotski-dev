package ca.zwd.klotski.views.mediators 
{
	import ca.zwd.klotski.events.GameEvent;
	import ca.zwd.klotski.model.Game;
	import ca.zwd.klotski.views.BackgroundView;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class BackgroundViewMediator extends Mediator 
	{
		[Inject]
		public var game:Game;
		
		[Inject]
		public var backgroundView:BackgroundView;
		
		override public function onRegister():void
		{
		}
	}
}