package 
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;

	public class HelpText extends MovieClip
	{

		private var help_Txt:String;
		public function HelpText(helpTxt:String)
		{
			// constructor code
			help_Txt = helpTxt;
			makeHelpText();
		}
		private function makeHelpText()
		{
			//define a size for my textField
			var myFormat:TextFormat = new TextFormat();
			myFormat.size = 20;
			myFormat.font = "Arial";

			//define the text field
			var myTextBox:TextField = new TextField();

			myTextBox.width = 470;
			myTextBox.height = 300;
			//change the size
			myTextBox.defaultTextFormat = myFormat;
			//show the input string
			myTextBox.text = help_Txt;
			//give the black color to string 
			myTextBox.textColor = 0x000000;

			addChild(myTextBox);
		}

	}

}