package 
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;
	import flash.display.Graphics;
	import flash.text.TextField;
	import flash.display.Shape;
	import flash.display.SimpleButton;

	public class popUpWin extends MovieClip
	{
		private var bgColor:Number;
		private var hint_Txt:String;
		private var OK:okShow = new okShow  ;
		//-------------------------------------
		public function popUpWin(hintTxt:String,okButton:okShow,popUpBgColor:Number)
		{
			// constructor code
			bgColor = popUpBgColor;

			drawRec(-5,-5,200,311);//hint line
			drawRecBg(-5,-5,310,199,bgColor);//hint line BG

			hint_Txt = hintTxt;
			OK = okButton;

			makePopUp();

			makeButton(140,165);
		}

		//--------------------make the popup-------------------------
		private function makePopUp()
		{
			//define a size for my textField
			var myFormat:TextFormat = new TextFormat  ;
			myFormat.size = 15;
			myFormat.font = "Arial";

			//define the textfield
			var myTextBox:TextField = new TextField  ;

			myTextBox.width = 310;
			myTextBox.height = 200;
			//change the size
			myTextBox.defaultTextFormat = myFormat;
			//show the input string
			myTextBox.text = hint_Txt;
			//give the black color to string 
			myTextBox.textColor = 0xffffff;

			addChild(myTextBox);
		}
		//------------------------------draw rectangel line----------------
		private function drawRec(recX:Number,recY:Number,recW:Number,recH:Number):void
		{
			graphics.lineStyle(3);
			graphics.drawRect(recX,recY,recH,recW);
		}
		//...............................draw rectangel bg......................
		//drow rectangles BG
		private function drawRecBg(recBgX:Number,recBgY:Number,recBgH:Number,recBgW:Number,bgColor:Number):void
		{
			var rectangle:Shape = new Shape  ;
			rectangle.graphics.beginFill(bgColor);
			rectangle.graphics.drawRect(recBgX,recBgY,recBgH,recBgW);
			rectangle.graphics.endFill();
			addChild(rectangle);
		}
		//------------------------------Make the Button----------------
		private function makeButton(btnTextX:Number,btnTextY:Number)
		{
			addChild(OK);
			OK.x = btnTextX;
			OK.y = btnTextY;

		}

	}

}