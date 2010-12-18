package org.assetloader.demo.controller
{
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.core.ILoader;
	import org.assetloader.demo.model.ids.AssetId;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author Matan Uberstein
	 */
	public class GalleryConfigLoadedCommand extends SignalCommand
	{
		[Inject]
		public var assetloader : IAssetLoader;

		override public function execute() : void
		{
			var preloader : IAssetLoader = assetloader.getAssetLoader(AssetId.PRELOAD);
			signalCommandMap.mapSignal(preloader.onComplete, PreloadCompleteCommand, true);
			
			var cssLoader : ILoader = preloader.getLoader(AssetId.DEFAULT_CSS);
			signalCommandMap.mapSignal(cssLoader.onComplete, ShowPreloaderCommand, true);
			
			preloader.start();
		}
	}
}
