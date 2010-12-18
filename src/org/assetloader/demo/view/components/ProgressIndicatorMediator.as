package org.assetloader.demo.view.components
{
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.core.ILoader;
	import org.assetloader.signals.LoaderSignal;
	import org.assetloader.signals.ProgressSignal;
	import org.robotlegs.mvcs.Mediator;

	import flash.text.StyleSheet;

	/**
	 * @author Matan Uberstein
	 */
	public class ProgressIndicatorMediator extends Mediator
	{
		[Inject]
		public var view : ProgressIndicator;

		[Inject]
		public var assetloader : IAssetLoader;

		[Inject]
		public var style : StyleSheet;

		override public function onRegister() : void
		{
			view.init(style);

			var loader : ILoader = view.loader;

			loader.onOpen.add(open_handler);
			loader.onProgress.add(progress_handler);
			loader.onComplete.add(complete_handler);
		}

		override public function onRemove() : void
		{
			view.destroy();
		}

		protected function open_handler(signal : LoaderSignal) : void
		{
			view.show();
		}

		protected function progress_handler(signal : ProgressSignal) : void
		{
			view.progress = signal.progress;
		}

		protected function complete_handler(signal : LoaderSignal, payload : *) : void
		{
			view.onHideComplete.add(view_onHideComplete_handler);
			view.hide();
		}

		protected function view_onHideComplete_handler() : void
		{
			view.remove();
		}
	}
}
