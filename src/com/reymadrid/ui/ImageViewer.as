package com.reymadrid.ui
{
	import com.reymadrid.events.*;
	import com.reymadrid.loaders.*;
	
	import flash.display.Sprite;
	
	public class ImageViewer extends Sprite
	{
		private var _imageList:Array;
		private var _path:String;
		private var _currentImage:int;
		private var _ld:ImageLoader;
		
		//imageViewer loads the corresponding weather image
		public function ImageViewer()
		{
			init();
		}
		
		private function init() : void
		{
			_imageList = [];
			_currentImage = 0;
		}
		
		//loads the current image into the imageLoader()
		private function loadImg() : void
		{
			_ld = new ImageLoader(_path + _imageList[_currentImage]);
			_ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);
		}
		
		private function onLoad(event:ImageEvent) : void
		{
			if (numChildren > 0)
			{
				removeChildAt(0);
			}
			addChild(event.image);
		}
		
		//display() calls for the loadImg()
		public function display() : void
		{
			loadImg();
		}
		
		public function next() : void
		{
			var iv:ImageViewer = this;
			var ci:int = _currentImage + 1;
			iv._currentImage = ci;
			if (_currentImage == _imageList.length)
			{
				_currentImage = 0;
			}
			_ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);
			_ld = new ImageLoader(_path + _imageList[_currentImage]);
		}
		
		public function previous() : void
		{
			var iv:ImageViewer = this;
			var ci:int = _currentImage - 1;
			iv._currentImage = ci;
			if (_currentImage < 0)
			{
				_currentImage = _imageList.length - 1;
			}
			_ld.addEventListener(ImageEvent.IMAGE_LOADED, onLoad);
			_ld = new ImageLoader(_path + _imageList[_currentImage]);
		}
		
		public function set path(value:String) : void
		{
			_path = value;
		}
		
		public function set imageList(value:Array) : void
		{
			_imageList = value;
		}
		
		public function get currentImage() : int
		{
			return _currentImage;
		}
	}
}
