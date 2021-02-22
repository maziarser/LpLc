package 
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;

	public class Header extends MovieClip
	{

		private var header_Txt:String;
		public function Header(headerTxt:String)
		{
			// constructor code
			header_Txt = headerTxt;
			makeHeaderText();
		}
		private function makeHeaderText()
		{
			//define a size for my textField
			var myFormat:TextFormat = new TextFormat();
			myFormat.size = 25;
			myFormat.font = "Franklin Gothic Heavy";

			//define the textfield
			var myTextBox:TextField = new TextField();

			myTextBox.width = 400;
			myTextBox.height = 40;
			//change the size
			myTextBox.defaultTextFormat = myFormat;
			//show the input string
			myTextBox.text = header_Txt;
			//give the black color to string 
			myTextBox.textColor = 0x000000;

			addChild(myTextBox);
		}

	}

}