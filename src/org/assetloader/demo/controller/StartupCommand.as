package org.assetloader.demo.controller
{
	import org.assetloader.core.IAssetLoader;
	import org.robotlegs.mvcs.SignalCommand;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.Font;

	/**
	 * @author Matan Uberstein
	 */
	public class StartupCommand extends SignalCommand
	{
		[Inject]
		public var assetloader : IAssetLoader;

		override public function execute() : void
		{
			contextView.stage.align = StageAlign.TOP_LEFT;
			contextView.stage.scaleMode = StageScaleMode.NO_SCALE;

			var fonts : FontClass_192dc4d44602 = new FontClass_192dc4d44602();

			for(var i : int = 0; i <= 3; i++)
			{
				Font.registerFont(fonts["font" + i]);
			}

			signalCommandMap.mapSignal(assetloader.onError, LoadingErrorCommand, true);
			signalCommandMap.mapSignal(assetloader.onChildError, LoadingErrorCommand, true);
			signalCommandMap.mapSignal(assetloader.onConfigLoaded, GalleryConfigLoadedCommand, true);

			assetloader.addConfig("data/gallery-config.xml");
		}
	}
}
