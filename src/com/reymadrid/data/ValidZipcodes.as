package com.reymadrid.data
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class ValidZipcodes extends Sprite
	{
		private var _validZips:String;
		
		public function ValidZipcodes()
		{
			super();
			loadData();
		}
		private function loadData() : void
		{
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.load(new URLRequest("assets/data/zipcodes.txt"));
			urlLoader.addEventListener(Event.COMPLETE, onLoad);
		}
		
		private function onLoad(event:Event) : void
		{
			_validZips = event.target.data;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get validZips() : String
		{
			return _validZips;
		}
		
	}
}