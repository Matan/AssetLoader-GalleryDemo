package org.assetloader
{
	import flash.display.Sprite;

	import org.assetloader.demo.GalleryContext;

	[SWF(backgroundColor="#000000", frameRate="31", width="1440", height="800")]
	/**
	 * @author Matan Uberstein
	 */
	public class Gallery extends Sprite
	{
		protected var _context : GalleryContext;

		public function Gallery()
		{
			_context = new GalleryContext(this);
		}
	}
}
