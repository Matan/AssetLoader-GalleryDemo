package org.assetloader.demo.controller
{
	import org.assetloader.signals.ErrorSignal;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class LoadingErrorCommand extends Command
	{
		[Inject]
		public var errorSignal : ErrorSignal;

		override public function execute() : void
		{
			trace(errorSignal.message);
		}
	}
}
