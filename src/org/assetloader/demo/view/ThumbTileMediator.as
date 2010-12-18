package org.assetloader.demo.view
{
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.demo.model.ids.AssetId;
	import org.assetloader.demo.view.components.Thumb;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Matan Uberstein
	 */
	public class ThumbTileMediator extends Mediator
	{
		[Inject]
		public var view : ThumbTile;

		[Inject]
		public var assetloader : IAssetLoader;

		override public function onRegister() : void
		{
			view.init();

			var thumbsLoader : IAssetLoader = assetloader.getAssetLoader(AssetId.PRELOAD).getAssetLoader(AssetId.THUMBS);

			var iL : int = thumbsLoader.ids.length;
			for(var i : int = 0; i < iL; i++)
			{
				view.addThumb(new Thumb(thumbsLoader.ids[i]));
			}
		}
	}
}
