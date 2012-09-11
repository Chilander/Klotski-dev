package ca.zwd.klotski.commands 
{
	import ca.zwd.klotski.events.GameEvent;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class CalculateBlockMoveCommand extends Command 
	{
		[Inject]
		public var gameEvent:GameEvent;
		
		override public function execute():void
		{
			trace("hohoho");
		}
		
	}

}