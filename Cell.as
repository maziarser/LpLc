package 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	//---------------------------------------
	//This class is to make Cells to be used for Truth Table
	public class Cell extends Sprite
	{
		//---------------------------------------
		protected var m_oLabel:TextField;
		protected var m_nWidth:Number = 40;
		protected var m_nHeight:Number = 30;
		protected var _backgroundColor:Number;
		//------------------------------------------------------------------------
		public function Cell()
		{
			//Constructor
			super();
			m_oLabel = new TextField  ;
			m_oLabel.text = "Mazyar";
			m_oLabel.autoSize = TextFieldAutoSize.CENTER;

			addChild(m_oLabel);

			setLabel("Mazyar");
		}
		//------------------------------------------------------------------------
		//to make the labels
		public function setLabel(p_sLabel:String):void
		{
			m_oLabel.text = p_sLabel || "";
			updateLayout();
		}
		//---------------------------------------
		//to get the Bg color
		public function get backgroundColor():Number
		{
			return _backgroundColor;
		}
		//---------------------------------------
		//to make the Bg color
		public function set backgroundColor(value:Number):void
		{
			_backgroundColor = value;
			redraw();
		}
		//------------------- OVERRIDDEN -------------------
		//to get the width for cells
		override public function get width():Number
		{
			return m_nWidth;
		}
		//---------------------------------------
		//to make the width
		override public function set width(value:Number):void
		{
			m_nWidth = value;
			updateLayout();
			redraw();
		}
		//---------------------------------------
		//to get the height for cells
		override public function get height():Number
		{
			return m_nHeight;
		}
		//---------------------------------------
		//to make the height for cells
		override public function set height(value:Number):void
		{
			m_nHeight = value;
			updateLayout();
			redraw();
		}
		//---------------------------------------
		//make the width and height for each cell
		protected function updateLayout():void
		{
			//adjust layout
			if (m_oLabel)
			{
				m_oLabel.x = width * .5 - m_oLabel.width * .5;
				m_oLabel.y = height * .5 - m_oLabel.height * .5;
			}
		}
		//---------------------------------------
		//make the bg for each cell
		protected function redraw():void
		{
			var bg:Graphics = this.graphics;
			bg.beginFill(_backgroundColor);
			bg.lineStyle(2,0x000000);
			bg.drawRect(0,0,width,height);
			bg.endFill();
		}
		//---------------------------------------
	}
}