package {
	import flash.display.Sprite;
	import flash.display.MovieClip;

	//imports 

	//-------------------------
	public class Gate extends MovieClip {

		public var gateType: String;
		public var gateName: String;

		public var gateOutput: String;
		public var gateInput: Array = [];

		private var canvas_mux: Sprite;

		public var gateX: Number;
		public var gateY: Number;

		private var nand_mux: showNand = new showNand();
		//-----
		private var nandN01_mux: showN01 = new showN01();
		private var outNotS1_mux: showOutNS1 = new showOutNS1();
		//-----
		private var nandN02_mux: showN02 = new showN02();
		private var outNotS2_mux: showOutNS2 = new showOutNS2();
		//-----
		private var nandM01_mux: showM01 = new showM01();
		private var outQ1_mux: showOutQ1 = new showOutQ1();
		//-----
		private var nandM02_mux: showM02 = new showM02();
		private var outQ2_mux: showOutQ2 = new showOutQ2();
		//-----
		private var nandM03_mux: showM03 = new showM03();
		private var outQ3_mux: showOutQ3 = new showOutQ3();
		//-----
		private var nandM04_mux: showM04 = new showM04();
		private var outQ4_mux: showOutQ4 = new showOutQ4();
		//-----
		private var nandO1_mux: showO1 = new showO1();

		//----------Flags
		private var connectInp01: Boolean = false;
		private var connectInp02: Boolean = false;
		private var connectInp03: Boolean = false;
		private var connectInp04: Boolean = false;
		public var connectionInputs: Array = [connectInp01, connectInp02, connectInp03, connectInp04];

		//--------inputs locations
		private var inpX: Number;

		private var inpY01: Number;
		private var inpY02: Number;
		private var inpY03: Number;
		private var inpY04: Number;
		
		public var outputX: Number;
		public var outputY: Number;
		//------------------------------
		public function Gate(gType: String, gName: String, gOutput: String, gInput: Array, canvasMux: Sprite) {
			// constructor code
			gateType = gType;
			gateName = gName;
			gateOutput = gOutput;
			gateInput = gInput;
			canvas_mux = canvasMux;
			drawGate(gateName, gateOutput);
		}
		//..............................
		function drawGate(gName: String, gOutput: String): void {
			if (gName == "n1") {
				drawType(100, 195);
				gateX = 100;
				gateY = 195;
				//.
				nandN01_mux.x = 100;
				nandN01_mux.y = 195;
				canvas_mux.addChild(nandN01_mux);
				//.
				outNotS1_mux.x = 140;
				outNotS1_mux.y = 195;
				canvas_mux.addChild(outNotS1_mux);
				//.
				inputConnections();
				//...
			} else if (gName == "n2") {
				drawType(135, 240);
				gateX = 135;
				gateY = 240;
				//.
				nandN02_mux.x = 135;
				nandN02_mux.y = 240;
				canvas_mux.addChild(nandN02_mux);
				//.
				outNotS2_mux.x = 175;
				outNotS2_mux.y = 240;
				canvas_mux.addChild(outNotS2_mux);
				//.
				inputConnections();
				//...
			} else if (gName == "m1") {
				drawType(240, 20);
				gateX = 240;
				gateY = 20;
				//.
				nandM01_mux.x = 240;
				nandM01_mux.y = 20;
				canvas_mux.addChild(nandM01_mux);
				//.
				outQ1_mux.x = 280;
				outQ1_mux.y = 20;
				canvas_mux.addChild(outQ1_mux);
				//.
				inputConnections();
				//...
			} else if (gName == "m2") {
				drawType(200, 65);
				gateX = 200;
				gateY = 65;
				//.
				nandM02_mux.x = 200;
				nandM02_mux.y = 65;
				canvas_mux.addChild(nandM02_mux);
				//.
				outQ2_mux.x = 240;
				outQ2_mux.y = 65;
				canvas_mux.addChild(outQ2_mux);
				//.
				inputConnections();
				//...
			} else if (gName == "m3") {
				drawType(200, 110);
				gateX = 200;
				gateY = 110;
				//.
				nandM03_mux.x = 200;
				nandM03_mux.y = 110;
				canvas_mux.addChild(nandM03_mux);
				//.
				outQ3_mux.x = 240;
				outQ3_mux.y = 110;
				canvas_mux.addChild(outQ3_mux);
				//.
				inputConnections();
				//...
			} else if (gName == "m4") {
				drawType(240, 155);
				gateX = 240;
				gateY = 155;
				//.
				nandM04_mux.x = 240;
				nandM04_mux.y = 155;
				canvas_mux.addChild(nandM04_mux);
				//.
				outQ4_mux.x = 280;
				outQ4_mux.y = 155;
				canvas_mux.addChild(outQ4_mux);
				//.
				inputConnections();
				//...
			} else if (gName == "o1") {
				drawType(330, 90);
				gateX = 330;
				gateY = 90;
				//.
				nandO1_mux.x = 330;
				nandO1_mux.y = 90;
				canvas_mux.addChild(nandO1_mux);
				//.
				inputConnections();
			}
			//...
			function drawType(gateX: Number, gateY: Number): void {
				nand_mux.x = gateX;
				nand_mux.y = gateY;
				canvas_mux.addChild(nand_mux);
			}
			//...

			//... to find the number of inputs and location of each inputs
			function inputConnections(): void {
				outputX = gateX + 20;
				outputY = gateY;
				//...
				if (gateInput.length == 2) {
					inpX = gateX - 15;

					inpY01 = gateY - 15;
					inpY02 = gateY + 15;
					//...
				} else if (gateInput.length == 3) {
					inpX = gateX - 15;

					inpY01 = gateY - 10;
					inpY02 = gateY;
					inpY03 = gateY + 10;
					//...
				} else if (gateInput.length == 4) {
					inpX = gateX - 15;

					inpY01 = gateY - 16;
					inpY02 = gateY - 8;
					inpY03 = gateY + 6;
					inpY04 = gateY + 16;
				}
				//...to make the flag of each input true - it means that this input is ready to be connected. 
				//...the flag will be false, when the connection is done.
				for (var i: int = 0; i <= gateInput.length - 1; i++) {
					connectionInputs[i] = true;
				} //end for
			} // end function inputConnections
		} //end function drawGate
		//to return the inputs locations to the main program-body 
		public function returnLocInput(locInput: int): Array {
			var location_input: Array = [];

			location_input.push(inpX);

			if (locInput == 0) {
				location_input.push(inpY01);
			} else if (locInput == 1) {
				location_input.push(inpY02);
			} else if (locInput == 2) {
				location_input.push(inpY03);
			} else if (locInput == 3) {
				location_input.push(inpY04);
			}
			return (location_input);
		}// end of fuction 

	}

}