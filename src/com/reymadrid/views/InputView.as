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
		
		public function InputView()
		{
			setupButtons();
			restrictInput();
			tfError.text = "";
			_degreeType = "F";
			_speedType = "MPH";
		}
		
		private function setupButtons() : void
		{
			fahrBtn.gotoAndStop(2);
			celsiusBtn.gotoAndStop(1);
			submitBtn.gotoAndStop(1);
			fahrBtn.addEventListener(MouseEvent.CLICK, toggleFahr);
			celsiusBtn.addEventListener(MouseEvent.CLICK, toggleCelsius);
			submitBtn.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			tfInput.addEventListener(MouseEvent.CLICK, clearText);
		}
		
		private function restrictInput() : void
		{
			tfInput.restrict = "0-9";
			tfInput.maxChars = 5;
		}
		
		private function toggleFahr(event:MouseEvent) : void
		{
			if (fahrBtn.currentFrame == 1)
			{
				fahrBtn.gotoAndStop(2);
				celsiusBtn.gotoAndStop(1);
				_degreeType = "F";
				_speedType = "MPH";
			}
		}
		
		private function toggleCelsius(event:MouseEvent) : void
		{
			if (celsiusBtn.currentFrame == 1)
			{
				celsiusBtn.gotoAndStop(2);
				fahrBtn.gotoAndStop(1);
				_degreeType = "C";
				_speedType = "KPH";
			}
		}
		
		private function mouseDown(event:MouseEvent) : void
		{
			submitBtn.gotoAndStop(2);
			submitBtn.addEventListener(MouseEvent.MOUSE_UP, mouseUp);		
		}
		
		private function mouseUp(event:MouseEvent) : void
		{
			submitBtn.gotoAndStop(1);
			submitBtn.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		
		private function clearText(event:MouseEvent) : void
		{
			tfInput.text = "";
			tfInput.removeEventListener(MouseEvent.CLICK, clearText);
		}
		
		public function get zipcode() : String
		{
			_zipcode = tfInput.text;
			return _zipcode;
		}
		
		public function set zipcode(value:String) : void
		{
			_zipcode = value;
			tfInput.text = _zipcode;
			return;
		}
		
		public function get error() : String
		{
			_error = tfError.text;
			return _error;
		}
		
		public function set error(value:String) : void
		{
			_error = value;
			tfError.text = _error;
			return;
		}
		
		public function get degreeType() : String
		{
			var dt:String = _degreeType;
			return dt;
		}
		
		public function get speedType() : String
		{
			var st:String = _speedType;
			return st;
		}
	}
}
