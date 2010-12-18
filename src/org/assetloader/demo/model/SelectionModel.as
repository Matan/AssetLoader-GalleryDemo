package org.assetloader.demo.model
{
	import org.assetloader.demo.events.SelectionEvent;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author Matan Uberstein
	 */
	public class SelectionModel extends Actor
	{
		protected var _selectedId : String;

		public function SelectionModel()
		{
		}

		public function get selectedId() : String
		{
			return _selectedId;
		}

		public function set selectedId(value : String) : void
		{
			if(_selectedId != value)
			{
				_selectedId = value;
				dispatch(new SelectionEvent(SelectionEvent.CHANGE, _selectedId));
			}
		}
	}
}
