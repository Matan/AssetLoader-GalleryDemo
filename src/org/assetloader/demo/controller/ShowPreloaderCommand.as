package org.assetloader.demo.controller
{
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.demo.model.ids.AssetId;
	import org.assetloader.demo.view.components.ProgressIndicator;
	import org.robotlegs.mvcs.Command;

	import flash.display.Stage;
	import flash.text.StyleSheet;

	/**
	 * @author Matan Uberstein
	 */
	public class ShowPreloaderCommand extends Command
	{
		[Inject]
		public var assetloader : IAssetLoader;

		override public function execute() : void
		{
			var preloader : IAssetLoader = assetloader.getAssetLoader(AssetId.PRELOAD);
			injector.mapValue(StyleSheet, preloader.getAsset(AssetId.DEFAULT_CSS));

			var stage : Stage = contextView.stage;
			var progress : ProgressIndicator = new ProgressIndicator(preloader);
			progress.x = stage.stageWidth / 2;
			progress.y = stage.stageHeight / 2;

			contextView.addChild(progress);
		}
	}
}
