package org.assetloader.demo.view
{
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.core.ILoader;
	import org.assetloader.demo.events.SelectionEvent;
	import org.assetloader.demo.model.ids.AssetId;
	import org.assetloader.signals.LoaderSignal;
	import org.robotlegs.mvcs.Mediator;

	import flash.display.Bitmap;

	/**
	 * @author Matan Uberstein
	 */
	public class HighResImageMediator extends Mediator
	{
		[Inject]
		public var view : HighResImage;

		[Inject]
		public var assetloader : IAssetLoader;

		protected var _highLoader : IAssetLoader;
		protected var _imageLoader : ILoader;

		override public function onRegister() : void
		{
			eventMap.mapListener(eventDispatcher, SelectionEvent.CHANGE, selectionChange_handler, SelectionEvent);
			view.init();

			_highLoader = assetloader.getAssetLoader(AssetId.HIGH);
		}

		protected function selectionChange_handler(event : SelectionEvent) : void
		{
			if(_imageLoader)
				_imageLoader.onComplete.remove(imageLoader_onComplete_handler);

			_imageLoader = _highLoader.getLoader(event.id);

			if(_imageLoader.loaded)
				updateView(_imageLoader.data);
			else
			{
				_imageLoader.onComplete.add(imageLoader_onComplete_handler);
				
				if(!_imageLoader.inProgress)
					_imageLoader.start();
			}
		}

		protected function imageLoader_onComplete_handler(signal : LoaderSignal, bitmap : Bitmap) : void
		{
			_imageLoader.onComplete.remove(imageLoader_onComplete_handler);
			updateView(bitmap);
		}

		protected function updateView(bitmap : Bitmap) : void
		{
			view.show(bitmap);
			_imageLoader = null;
		}
	}
}
