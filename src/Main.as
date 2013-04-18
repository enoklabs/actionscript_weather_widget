/*
Rey Madrid
04/17/13
FAT 1304 01
Assignment #2 - Weather Application
*/ 
package
{
	import com.reymadrid.app.Application;
	import flash.display.Sprite;

	[SWF (height="400", width="600", backgroundColor="0x000000")]
	
	
	public class Main extends Sprite
	{
		
		public function Main()
		{
			this.init();
			return;
		}// end function
		
		private function init() : void
		{
			var app:Application = new Application();
			app.x = stage.stageWidth / 2;
			app.y = 5;
			this.addChild(app);
			return;
		}// end function
		
	}
}
