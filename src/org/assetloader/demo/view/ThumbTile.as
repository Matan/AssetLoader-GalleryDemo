package org.assetloader.demo.view
{
	import org.assetloader.demo.view.components.Thumb;

	import flash.display.Sprite;

	/**
	 * @author Matan Uberstein
	 */
	public class ThumbTile extends Sprite
	{
		protected var _thumbs : Array;
		protected var _container : Sprite;

		public function ThumbTile()
		{
		}

		public function init() : void
		{
			_thumbs = [];
			_container = new Sprite();
			addChild(_container);
		}

		public function addThumb(thumb : Thumb) : void
		{
			thumb.x = 200 * _thumbs.length;
			_container.addChild(thumb);
			_container.x = - (_container.width / 2);

			_thumbs.push(thumb);
		}
	}
}
