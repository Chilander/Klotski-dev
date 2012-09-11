package ca.zwd.klotski.commands 
{
	import ca.zwd.klotski.commands.init.CreateGameViewCommand;
	import ca.zwd.klotski.commands.init.LoadGameDataCommand;
	import ca.zwd.klotski.events.InitEvent;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * ...
	 * @author Wandi Zhang
	 */
	public class InitCommand extends Command 
	{
		override public function execute():void
		{
			commandMap.mapEvent(InitEvent.START, LoadGameDataCommand, InitEvent, true);
			commandMap.mapEvent(InitEvent.GAME_DATA_LOADED, CreateGameViewCommand, InitEvent, true);
			
			dispatch(new InitEvent(InitEvent.START));
		}
	}
}