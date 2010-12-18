package org.assetloader.demo.view
{
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Matan Uberstein
	 */
	public class CanvasMediator extends Mediator
	{
		[Inject]
		public var view : Canvas;

		override public function onRegister() : void
		{
			view.init();
		}

		override public function onRemove() : void
		{
			view.destroy();
		}

	}
}
