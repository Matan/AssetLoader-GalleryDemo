package org.assetloader.demo.controller
{
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.demo.model.ids.AssetId;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;

	/**
	 * @author Matan Uberstein
	 */
	public class PreloadCompleteCommand extends Command
	{
		[Inject]
		public var assetloader : IAssetLoader;

		override public function execute() : void
		{
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
			
			assetloader.startLoader(AssetId.HIGH);
		}
	}
}
