package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;
	
	//this class designed to show the boolean function to the user
	public class Algebra extends MovieClip
	{
		//Boolean function which is shown based on each Gate
		private var stringtoShow:String;
		//----------------------------------
		public function Algebra(string:String)
		{
			//Constructor
			stringtoShow = string;
			makeDynamicText();
		}
		//----------------------------------
		private function makeDynamicText()
		{
			//define a size for my textField
			var myFormat:TextFormat = new TextFormat();
			myFormat.size = 18;

			//define the textfield
			var myTextBox:TextField = new TextField();

			myTextBox.width = 210;
			myTextBox.height = 50;
			//change the size
			myTextBox.defaultTextFormat = myFormat;
			//bg color for textfield
			myTextBox.opaqueBackground = 0xeeeeee;
			//show the input string
			myTextBox.text = stringtoShow;
			//give the black color to string 
			myTextBox.textColor = 0x000000;

			addChild(myTextBox);
		}
	}
}