package org.assetloader.demo.events
{
	import flash.events.Event;

	/**
	 * @author Matan Uberstein
	 */
	public class SelectionEvent extends Event
	{
		public static const CHANGE : String = "CHANGE";

		public var id : String;

		public function SelectionEvent(type : String, id : String)
		{
			super(type);
			this.id = id;
		}
	}
}
