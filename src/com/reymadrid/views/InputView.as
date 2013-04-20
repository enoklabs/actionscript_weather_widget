package com.reymadrid.views
{
	import flash.events.MouseEvent;
	
	import libs.InputViewBase;
	import flash.display.MovieClip;
	
	public class InputView extends InputViewBase
	{
		private var _zipcode:String;
		private var _error:String;
		private var _degreeType:String;
		private var _speedType:String;
		
		//displays inputView that allows user to input
		//zipcode of city and select the degree type
		public function InputView()
		{
			setupButtons();
			restrictInput();
			tfError.text = "";
			_degreeType = "F";
			_speedType = "MPH";
		}
		
		//displays fahrenheit, celsius, and submit buttons
		//they listen for mouse events and trigers the following functions
		private function setupButtons():void
		{
			fahrBtn.gotoAndStop(2);
			celsiusBtn.gotoAndStop(1);
			submitBtn.gotoAndStop(1);
			fahrBtn.addEventListener(MouseEvent.CLICK, toggleFahr);
			celsiusBtn.addEventListener(MouseEvent.CLICK, toggleCelsius);
			submitBtn.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			tfInput.addEventListener(MouseEvent.CLICK, clearText);
		}
		
		//text field character restrictions to 5 numbers
		private function restrictInput():void
		{
			tfInput.restrict = "0-9";
			tfInput.maxChars = 5;
		}
		
		//when fahrenheit button is toggled, is turned blue
		//celsius turns gray and drgree type becomes F
		private function toggleFahr(event:MouseEvent):void
		{
			if (fahrBtn.currentFrame == 1)
			{
				fahrBtn.gotoAndStop(2);
				celsiusBtn.gotoAndStop(1);
				_degreeType = "F";
				_speedType = "MPH";
			}
		}
		
		//when celsius button is toggled, is turned blue
		//fahrenheit turns gray and drgree type becomes C
		private function toggleCelsius(event:MouseEvent):void
		{
			if (celsiusBtn.currentFrame == 1)
			{
				celsiusBtn.gotoAndStop(2);
				fahrBtn.gotoAndStop(1);
				_degreeType = "C";
				_speedType = "KPH";
			}
		}
		
		//when submit button clicked, frame changes and calls mouseUp()
		private function mouseDown(event:MouseEvent):void
		{
			submitBtn.gotoAndStop(2);
			submitBtn.addEventListener(MouseEvent.MOUSE_UP, mouseUp);		
		}
		
		//mouseUp changes sibmit button back to frame one
		//removes event listener mouseUp
		private function mouseUp(event:MouseEvent):void
		{
			submitBtn.gotoAndStop(1);
			submitBtn.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		
		//when text input is clicked, it clears the text
		private function clearText(event:MouseEvent):void
		{
			tfInput.text = "";
			tfInput.removeEventListener(MouseEvent.CLICK, clearText);
		}
		
		//setter and getter stores and returns 
		//textfield input number into the _zipcode variable
		public function get zipcode() : String
		{
			_zipcode = tfInput.text;
			return _zipcode;
		}

		public function set zipcode(value:String):void
		{
			_zipcode = value;
			tfInput.text = _zipcode;
		}
		
		//setter and getter stores and returns 
		//error message into the _error variable
		public function get error() : String
		{
			_error = tfError.text;
			return _error;
		}
		
		public function set error(value:String):void
		{
			_error = value;
			tfError.text = _error;
			return;
		}
		
		//stores and returns degree type into the _degreeType variable
		public function get degreeType():String
		{
			var dt:String = _degreeType;
			return dt;
		}
		
		//stores and returns speed type into the _speedType variable
		public function get speedType():String
		{
			var st:String = _speedType;
			return st;
		}
	}
}
