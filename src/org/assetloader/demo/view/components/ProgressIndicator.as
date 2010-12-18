package org.assetloader.demo.view.components
{
	import org.osflash.signals.Signal;
	import org.assetloader.core.ILoader;

	import flash.text.TextFieldAutoSize;
	import flash.text.StyleSheet;

	import mu.tweens.TweenBundle;

	import org.libspark.betweenas3.BetweenAS3;

	/**
	 * @author Matan Uberstein
	 */
	public class ProgressIndicator extends ProgressIndicatorFC
	{
		public var onHideComplete : Signal = new Signal();

		protected var _loader : ILoader;
		protected var _twn : TweenBundle;

		public function ProgressIndicator(loader : ILoader)
		{
			_loader = loader;
			_twn = new TweenBundle();

			mouseChildren = mouseEnabled = false;
			alpha = 0;
			stop();
		}

		public function init(style : StyleSheet) : void
		{
			percentageTxt.embedFonts = true;
			percentageTxt.styleSheet = style;
			percentageTxt.autoSize = TextFieldAutoSize.CENTER;
		}

		public function destroy() : void
		{
			_twn.reset();
			_twn = null;

			onHideComplete.removeAll();
		}

		public function show() : void
		{
			play();

			_twn.reset();
			_twn.addTween(BetweenAS3.to(this, {alpha:1}, .3));
			_twn.play();
		}

		public function hide() : void
		{
			_twn.reset();
			_twn.addTween(BetweenAS3.to(this, {alpha:0}, .3));
			_twn.play();
			_twn.onComplete = onHideTweenComplete;
		}

		public function remove() : void
		{
			if(parent)
				if(parent.contains(this))
					parent.removeChild(this);
		}

		protected function onHideTweenComplete() : void
		{
			stop();
			progress = 0;

			onHideComplete.dispatch();
		}

		public function set progress(value : int) : void
		{
			if(!isNaN(value))
				percentageTxt.htmlText = "<span class='progress-indicator'>" + Math.round(value) + "%</span>";
		}

		public function get loader() : ILoader
		{
			return _loader;
		}
	}
}
