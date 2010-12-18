package org.assetloader.demo
{
	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.demo.controller.StartupCommand;
	import org.assetloader.demo.controller.StartupCompleteCommand;
	import org.assetloader.demo.model.SelectionModel;
	import org.assetloader.demo.view.Canvas;
	import org.assetloader.demo.view.CanvasMediator;
	import org.assetloader.demo.view.HighResImage;
	import org.assetloader.demo.view.HighResImageMediator;
	import org.assetloader.demo.view.ThumbTile;
	import org.assetloader.demo.view.ThumbTileMediator;
	import org.assetloader.demo.view.components.ProgressIndicator;
	import org.assetloader.demo.view.components.ProgressIndicatorMediator;
	import org.assetloader.demo.view.components.Thumb;
	import org.assetloader.demo.view.components.ThumbMediator;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author Matan Uberstein
	 */
	public class GalleryContext extends SignalContext
	{
		public function GalleryContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true)
		{
			super(contextView, autoStartup);
		}

		override public function startup() : void
		{
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand, ContextEvent, true);

			mediatorMap.mapView(Canvas, CanvasMediator);
			mediatorMap.mapView(HighResImage, HighResImageMediator);
			mediatorMap.mapView(ThumbTile, ThumbTileMediator);
			mediatorMap.mapView(Thumb, ThumbMediator);
			mediatorMap.mapView(ProgressIndicator, ProgressIndicatorMediator);

			injector.mapSingleton(SelectionModel);

			injector.mapSingletonOf(IAssetLoader, AssetLoader);

			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}
