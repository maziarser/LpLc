package 
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;
	//it is to make the small hint box and text
	public class Hint extends MovieClip
	{

		private var hint_Txt:String;
		public function Hint(hintTxt:String)
		{
			// constructor code
			hint_Txt = hintTxt;
			makeHintText();
		}
		private function makeHintText()
		{
			//define a size for my textField
			var myFormat:TextFormat = new TextFormat();
			myFormat.size = 13;
			myFormat.font = "Arial";

			//define the textfield
			var myTextBox:TextField = new TextField();

			myTextBox.width = 300;
			myTextBox.height = 20;
			//change the size
			myTextBox.defaultTextFormat = myFormat;
			//show the input string
			myTextBox.text = hint_Txt;
			//give the black color to string 
			myTextBox.textColor = 0x000000;

			addChild(myTextBox);
		}

	}

}