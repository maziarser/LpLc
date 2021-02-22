package 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.display.MovieClip;

	//this is to make the truth table for each gate
	public class truthTable extends MovieClip
	{
		//constructor
		//it will get the first 3 rows from us
		private var inputTruth01:String;
		private var inputTruth02:String;
		private var outputTruth:String;

		//-----------------------------------------
		public function truthTable(inputtruthA,inputTruthB,outputTruthQ)
		{
			inputTruth01 = inputtruthA;
			inputTruth02 = inputTruthB;
			outputTruth = outputTruthQ;

			drawTruthTable();
		}
		//-----------------------------------------
		private function drawTruthTable()
		{
			//instant from Cell class
			var cell: Cell = new Cell();

			//make my truth table 
			var truthTable: Sprite = new Sprite();

			addChild(truthTable);
			truthTable.x = 0;
			truthTable.y = 0;

			//draw cells in the truth table
			drawCell();

			//-----------------------------------------
			//draw the cells and put them in the truth table
			//make a lable for each cell
			function drawCell():void
			{
				for (var cellI: int = 0; cellI <= 4; cellI++)
				{
					for (var cellJ: int = 0; cellJ <= 2; cellJ++)
					{
						cell = new Cell();

						//..............................
						//header
						if (cellI == 0 && cellJ == 0)
						{
							cell.setLabel(inputTruth01.toString());
							cell.backgroundColor = 0xD6D6D6;
						}
						if (cellI == 0 && cellJ == 1)
						{
							cell.setLabel(inputTruth02.toString());
							cell.backgroundColor = 0xD6D6D6;
						}
						if (cellI == 0 && cellJ == 2)
						{
							cell.setLabel(outputTruth.toString());
							cell.backgroundColor = 0xD6D6D6;
						}
						//..............................
						if (cellI == 1 && cellJ == 0)
						{
							cell.setLabel("0".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						if (cellI == 1 && cellJ == 1)
						{
							cell.setLabel("0".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						if (cellI == 1 && cellJ == 2)
						{
							cell.setLabel("1".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						//...................................
						if (cellI == 2 && cellJ == 0)
						{
							cell.setLabel("0".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						if (cellI == 2 && cellJ == 1)
						{
							cell.setLabel("1".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						if (cellI == 2 && cellJ == 2)
						{
							cell.setLabel("1".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						//...................................
						if (cellI == 3 && cellJ == 0)
						{
							cell.setLabel("1".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						if (cellI == 3 && cellJ == 1)
						{
							cell.setLabel("0".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						if (cellI == 3 && cellJ == 2)
						{
							cell.setLabel("1".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						//...................................
						if (cellI == 4 && cellJ == 0)
						{
							cell.setLabel("1".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						if (cellI == 4 && cellJ == 1)
						{
							cell.setLabel("1".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						if (cellI == 4 && cellJ == 2)
						{
							cell.setLabel("0".toString());
							cell.backgroundColor = 0xeeeeee;
						}
						//..............................
						truthTable.addChild(cell);
						cell.x = cell.width * cellJ;
						cell.y = cell.height * cellI;
					}
				}
			}
		}

	}

}