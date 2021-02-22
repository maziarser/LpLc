package 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	//---------------------------------------
	//this class is to make the GRID for Graphical view
	public class Grid extends MovieClip
	{
		//use flag in the drawGrid Function
		private static var flag:Boolean = false;

		//it is to make all the wires in one grid only
		private var canvas:Sprite;
		//...
		private var startPoint:Point;
		private var endPoint:Point;

		private var currPoint:Point;

		private var tileVector:Vector.<Object > ;
		private var path:Vector.<Point > ;

		private var timer:Timer;
		//...
		//it will get the start and end point from us
		private var startX:int;
		private var startY:int;

		private var endX:int;
		private var endY:int;
		//...
		//it is getting wire color from us
		private var wireColor:int;
		
		//...
		private var change:Boolean;
		//---------------------------------------
		public function Grid(startXx:int,startYy:int,endXx:int,endYy:int,can:Sprite,wColor:int, chg:Boolean)
		{
			//constructor	
			change = chg;
			
			startX = startXx;
			startY = startYy;

			endX = endXx;
			endY = endYy;

			canvas = can;

			fieldSetup();
			drawGrid();
			findPath();

			wireColor = wColor;
		}
		//---------------------------------------
		private function fieldSetup():void
		{
			timer = new Timer(100);
			tileVector = new Vector.<Object>;
			for (var i:Number = 0; i < 94; i++)
			{
				tileVector[i] = new Vector.<Object>  ;
				for (var j:Number = 0; j < 53; j++)
				{
					tileVector[i][j] = new Object  ;
					tileVector[i][j].walkable = true;
					tileVector[i][j].startPoint = false;
					tileVector[i][j].endPoint = false;
					tileVector[i][j].visited = false;
				}
			}
			// while the starting point is choosen...
			startPoint = new Point(startX,startY);
			tileVector[startPoint.x][startPoint.y].startPoint = true;
			tileVector[startPoint.x][startPoint.y].visited = true;
			// ... we want the end point to be there

			endPoint = new Point(endX,endY);

			tileVector[endPoint.x][endPoint.y].endPoint = true;
		}
		//---------------------------------------
		// findPath function initializes the field and sets the time listener to draw the path
		private function findPath():void
		{
			path = new Vector.<Point >   ;
			path.push(startPoint);
			for (var i:Number = 0; i < 94; i++)
			{
				for (var j:Number = 0; j < 53; j++)
				{
					tileVector[i][j].visited = false;
				}
			}
			currPoint = new Point(startPoint.x,startPoint.y);
			timer.addEventListener(TimerEvent.TIMER,step);
			timer.start();
		}
		//---------------------------------------
		// step is the core function
		private function step(e:TimerEvent):void
		{
			var minF:Number = 9530;
			var savedPoint:Point;
			for (var i:Number = -1; i <= 1; i++)
			{
				for (var j:Number = -1; j <= 1; j++)
				{
					if (i != 0 && j == 0 || i == 0 && j != 0)
					{

						if (insideField(currPoint,i,j) && tileVector[currPoint.x + i][currPoint.y + j].walkable && ! tileVector[currPoint.x + i][currPoint.y + j].visited)
						{
							var g:Number = getG(i,j);
							var h:Number = manhattan(new Point(currPoint.x + i,currPoint.y + j),endPoint);
							var f:Number = g + h;
							if (f < minF)
							{
								minF = f;
								savedPoint = new Point(currPoint.x + i,currPoint.y + j);
							}
						}

					}
				}
			}
			//................................................
			if (savedPoint)
			{
				// continue...
				if (savedPoint.x != endPoint.x || savedPoint.y != endPoint.y)
				{
					drawTile(savedPoint.x,savedPoint.y,wireColor);
				}
				tileVector[savedPoint.x][savedPoint.y].visited = true;
				currPoint = savedPoint;
				path.push(currPoint);
				if (path.length > 2)
				{
					drawTile(path[path.length - 2].x,path[path.length - 2].y,wireColor);
				}
				if (currPoint.x == endPoint.x && currPoint.y == endPoint.y)
				{
					// solved
					timer.removeEventListener(TimerEvent.TIMER,step);
				}
			}
			else
			{
				if (path.length > 1)
				{
					currPoint = path[path.length - 2];
					drawTile(path[path.length - 1].x,path[path.length - 1].y,0xffffff);
					path.pop();
				}
				else
				{
					// can't be solved
					drawTile(currPoint.x,currPoint.y,0xff00ff);
					timer.removeEventListener(TimerEvent.TIMER,step);
				}
			}
		}
		//---------------------------------------
		private function getG(n1:Number,n2:Number)
		{
			return 1;
		}
		//---------------------------------------
		private function manhattan(p1:Point,p2:Point):Number
		{
			return Math.abs(p1.x - p2.x) + Math.abs(p1.y - p2.y);
		}
		//---------------------------------------
		private function insideField(p:Point,n1:Number,n2:Number):Boolean
		{
			if (p.x + n1 > 94 || p.x + n1 < 0 || p.y + n2 > 53 || p.y + n2 < 0)
			{
				return false;
			}
			return true;
		}
		//---------------------------------------
		private function drawTile(pX:Number,pY:Number,color:Number):void
		{
			canvas.graphics.beginFill(color,1);
			canvas.graphics.drawRect(pX * 5,pY * 5,5,5);
			canvas.graphics.endFill();
		}
		//---------------------------------------;
		private function drawGrid()
		{
			if(change == true && flag == true){
				change = false;
				flag = false;
			}
			canvas.graphics.lineStyle(1,0xeeeeee);
			for (var i:Number = 0; i < 94; i++)
			{
				for (var j:Number = 0; j < 53; j++)
				{
					if (flag == false)
					{
						drawTile(i,j,0xffffff);
					}
					if (tileVector[i][j].startPoint == true)
					{
						drawTile(i,j,0xffffff);
					}
					if (tileVector[i][j].endPoint == true)
					{
						drawTile(i,j,0xffffff);
					}
				}
			}
			flag = true;
		}

	}

}