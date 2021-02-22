package 
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;

	public class HeaderNum 
	{
		private var header_num:Number;
		public function HeaderNum(headerNum:Number)
		{
			// constructor code
			header_num = headerNum;
			makeNumber();
			
		}
		public function makeNumber():Number
		{
			
			return header_num;
		}

	}

}