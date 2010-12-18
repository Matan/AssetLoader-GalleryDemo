package org.assetloader.demo.controller
{
	import org.assetloader.demo.view.Canvas;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class StartupCompleteCommand extends Command
	{
		override public function execute() : void
		{
			contextView.addChild(new Canvas());
		}
	}
}
