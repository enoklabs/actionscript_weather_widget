package com.reymadrid.tools
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class ZipcodeConverter extends Sprite
	{
		private var _woeid:String;
		
		public function ZipcodeConverter(value:String)
		{
			query(value);
		}
		
		private function query(zip:String):void
		{
			var zipcode:* = "SELECT woeid FROM geo.places WHERE text=" + zip + " LIMIT 1";
			var urlLoader:* = new URLLoader();
			urlLoader.load(new URLRequest("http://query.yahooapis.com/v1/public/yql?q=" + zipcode));
			urlLoader.addEventListener(Event.COMPLETE, this.onParse);
		}
		
		private function onParse(event:Event):void
		{
			var xml:XML = XML(event.target.data);
			this._woeid = xml..woeid;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get woeid():String
		{
			return _woeid;
		}
		
	}
}
