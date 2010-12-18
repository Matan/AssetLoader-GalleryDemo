package org.assetloader.demo.view.components
{
	import org.assetloader.signals.LoaderSignal;
	import org.assetloader.core.ILoader;
	import org.libspark.betweenas3.BetweenAS3;

	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * @author Matan Uberstein
	 */
	public class Thumb extends Sprite
	{
		protected var _id : String;
		protected var _bitmap : Bitmap;
		protected var _progressIndicator : ProgressIndicator;

		public function Thumb(id : String)
		{
			_id = id;
		}

		public function init(bitmap : Bitmap, highImageLoader : ILoader) : void
		{
			_bitmap = bitmap;
			buttonMode = true;
			
			_bitmap.alpha = .5;
			addChild(_bitmap);

			_progressIndicator = new ProgressIndicator(highImageLoader);
			_progressIndicator.x = bitmap.width / 2;
			_progressIndicator.y = bitmap.height / 2;
			addChild(_progressIndicator);

			highImageLoader.onComplete.add(highImage_complete_handler);
		}

		protected function highImage_complete_handler(signal : LoaderSignal, payload : *) : void
		{
			signal.loader.onComplete.remove(highImage_complete_handler);

			BetweenAS3.to(_bitmap, {alpha:1}).play();
		}

		public function get id() : String
		{
			return _id;
		}
	}
}
