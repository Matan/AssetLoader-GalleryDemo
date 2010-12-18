package org.assetloader.demo.view.components
{
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.demo.model.SelectionModel;
	import org.assetloader.demo.model.ids.AssetId;
	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	/**
	 * @author Matan Uberstein
	 */
	public class ThumbMediator extends Mediator
	{
		[Inject]
		public var view : Thumb;

		[Inject]
		public var assetloader : IAssetLoader;

		[Inject]
		public var selectionModel : SelectionModel;

		override public function onRegister() : void
		{
			var highLoader : IAssetLoader = assetloader.getAssetLoader(AssetId.HIGH);
			var preloader : IAssetLoader = assetloader.getAssetLoader(AssetId.PRELOAD);
			var thumbLoader : IAssetLoader = preloader.getAssetLoader(AssetId.THUMBS);
			
			view.init(thumbLoader.getAsset(view.id), highLoader.getLoader(view.id));

			eventMap.mapListener(view, MouseEvent.CLICK, click_handler, MouseEvent);
		}

		protected function click_handler(event : MouseEvent) : void
		{
			selectionModel.selectedId = view.id;
		}
	}
}
