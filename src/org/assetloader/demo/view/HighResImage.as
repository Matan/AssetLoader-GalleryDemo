package org.assetloader.demo.view
{
	import org.libspark.betweenas3.BetweenAS3;
	import org.libspark.betweenas3.easing.Quadratic;

	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * @author Matan Uberstein
	 */
	public class HighResImage extends Sprite
	{
		protected var _bitmap : Bitmap;

		public function HighResImage()
		{
		}

		public function init() : void
		{
		}

		public function show(bitmap : Bitmap) : void
		{
			var prvBmp : Bitmap = _bitmap;
			_bitmap = bitmap;

			_bitmap.alpha = 0;
			_bitmap.x = -_bitmap.width / 2;
			_bitmap.y = -_bitmap.height / 2;
			addChild(_bitmap);

			var twns : Array = [];
			twns[0] = BetweenAS3.to(_bitmap, {alpha:1}, .5, Quadratic.easeOut);
			if(prvBmp)
				twns[1] = BetweenAS3.removeFromParent(prvBmp);

			BetweenAS3.serialTweens(twns).play();
		}
	}
}
