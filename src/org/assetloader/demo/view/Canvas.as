package org.assetloader.demo.view
{
	import org.osflash.signals.natives.NativeSignal;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Matan Uberstein
	 */
	public class Canvas extends Sprite
	{
		protected var _resized : NativeSignal;

		protected var _high : HighResImage;
		protected var _thumbs : ThumbTile;

		public function Canvas()
		{
		}

		public function init() : void
		{
			_high = new HighResImage();
			addChild(_high);

			_thumbs = new ThumbTile();
			addChild(_thumbs);

			_resized = new NativeSignal(stage, Event.RESIZE, Event);
			_resized.add(resized_handler);

			draw();
		}

		public function destroy() : void
		{
		}

		protected function draw() : void
		{
			var sW : Number = stage.stageWidth;
			var sH : Number = stage.stageHeight;

			_high.x = sW / 2;
			_high.y = (sH - 112) / 2;

			_thumbs.x = _high.x;
			_thumbs.y = sH - 112;
		}

		protected function resized_handler(event : Event) : void
		{
			draw();
		}
	}
}
