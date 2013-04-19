package com.reymadrid.app
{
	import com.reymadrid.data.ValidZipcodes;
	import com.reymadrid.tools.ZipcodeConverter;
	import com.reymadrid.views.InputView;
	import com.reymadrid.views.WeatherView;
	import com.reymadrid.vo.WeatherVO;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class Application extends Sprite
	{
		private var _woeid:String;
		private var _zc:ZipcodeConverter;
		private var _iv:InputView;
		private var _wv:WeatherView;
		private var _vo:WeatherVO;
		private var _validate:ValidZipcodes;
		private var _validZips:String;
		
		public function Application()
		{
			super();
			init();
		}
		
		//displays zipcode input window "InputView"
		private function init() : void
		{
			_iv = new InputView();
			addChild(_iv);
			
			//submit button calls onSubmit() when clicked
			_iv.submitBtn.addEventListener(MouseEvent.CLICK, onSubmit);
			_vo = new WeatherVO();
		}
		
		//calls for zipcode ValidateZipcodes class to check valid numbers
		private function onSubmit(event:MouseEvent) : void
		{
			_iv.error = "";
			_validate = new ValidZipcodes();
			_validate.addEventListener(Event.COMPLETE, zipsLoaded);
		}
		
		//validates the zipcode entered
		private function zipsLoaded(event:Event) : void
		{
			_validZips = _validate.validZips;
			if (_iv.zipcode.length == 5)
			{
			}
			if (_validZips.search(_iv.zipcode) != -1)
			{
				convertZip(_iv.zipcode);
				removeChild(_iv);
			}
			else
			{
				//if zipcode didn't validate, this error is displayed
				_iv.error = "* Please enter a valid U.S. zipcode. *";
			}

		}
		
		//send the string to the ZipConverter
		private function convertZip(value:String) : void
		{
			_zc = new ZipcodeConverter(value);
			_zc.addEventListener(Event.COMPLETE, conversionComplete);
		}
		
		//when converted, _woeid stores the zipcode
		private function conversionComplete(event:Event) : void
		{
			_woeid = _zc.woeid;
			xmlLoad();
		}
		
		//loads the xml from the yahoo weather
		private function xmlLoad() : void
		{
			var urlLoader:URLLoader = new URLLoader();
			
			//if degree type was fahrenheit, loads the fahrenheit xml
			//or else it loads the celsius xml data
			if (_iv.degreeType == "F")
			{
				urlLoader.load(new URLRequest("http://weather.yahooapis.com/forecastrss?w=" + _woeid));
			}
			else
			{
				urlLoader.load(new URLRequest("http://weather.yahooapis.com/forecastrss?w=" + _woeid + "&u=c"));
			}
			
			//when done calls for onParse function
			urlLoader.addEventListener(Event.COMPLETE, onParse);
		}
		
		//during parsing, weather details are stored 
		//inside variables listed on the WeatherVO 
		private function onParse(event:Event) : void
		{
			var xml:XML = XML(event.target.data);
			var ns:Namespace = new Namespace("http://xml.weather.yahoo.com/ns/rss/1.0");
			_vo.location = ns::location.@city + ", " + ns::location.@region + " (" + _iv.zipcode + ")";
			_vo.todayHigh = ns::forecast[0].@high;
			_vo.todayLow = ns::forecast[0].@low;
			_vo.todayCode = ns::forecast[0].@code;
			_vo.todayForecast = ns::forecast[0].@text;
			_vo.tomorrowHigh = ns::forecast[1].@high;
			_vo.tomorrowLow = ns::forecast[1].@low;
			_vo.tomorrowCode = ns::forecast[1].@code;
			_vo.tomorrowForecast = ns::forecast[1].@text;
			_vo.currentTemp = ns::condition.@temp;
			_vo.currentWindMPH = ns::wind.@speed;
			_vo.currentWindDirection = ns::wind.@direction;
			loadWeather();
		}
		
		//loads the weather results and displays the WeatherView()
		//ui elements receive the information stored inside the _vo variables
		private function loadWeather() : void
		{
			_wv = new WeatherView();
			_wv.location = _vo.location;
			_wv.degreeType = _iv.degreeType;
			_wv.todayHigh = _vo.todayHigh;
			_wv.todayLow = _vo.todayLow;
			_wv.todayCode = _vo.todayCode;
			_wv.todayForecast = _vo.todayForecast;
			_wv.tomorrowHigh = _vo.tomorrowHigh;
			_wv.tomorrowLow = _vo.tomorrowLow;
			_wv.tomorrowCode = _vo.tomorrowCode;
			_wv.tomorrowForecast = _vo.tomorrowForecast;
			_wv.currentTemp = _vo.currentTemp;
			_wv.currentWindMPH = _vo.currentWindMPH;
			_wv.speedType = _iv.speedType;
			_wv.currentWindDirection = _vo.currentWindDirection;
			addChild(_wv);
			
			//when reset button is clicked, application resets
			_wv.resetBtn.addEventListener(MouseEvent.CLICK, onReset);
		}
		
		//onReset removes the WeatherView and initializes the InputView
		private function onReset(event:MouseEvent) : void
		{
			removeChild(_wv);
			init();
		}
		
	}
}