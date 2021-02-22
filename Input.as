package {
	import flash.display.Sprite;
	import flash.display.MovieClip;

	public class Input extends MovieClip {
		private var inputLocY: int = 0;

		private static var count: int = 0;

		public var inputX: Number;
		public var inputY: Number;

		public var inputName: String;
		public var inputType: String;

		private var iName: String;
		private var inputLength: int = 0;
		private var iType: String;

		private var canvas_mux: Sprite;
		//.................
		private var inputA_mux: showInpA = new showInpA();
		private var inputB_mux: showInpB = new showInpB();
		private var inputC_mux: showInpC = new showInpC();
		private var inputD_mux: showInpD = new showInpD();
		private var selectorS1_mux: showSecS1 = new showSecS1();
		private var selectorS2_mux: showSecS2 = new showSecS2();
		//.................
		public function Input(iName: String, inputLength: int, iType: String, canvasMux: Sprite) {
			// constructor code
			count += 1;
			canvas_mux = canvasMux;
			inputName = iName;
			inputType = iType;
			drawInputs();
		}

		//----------------------Draw Inputs-----------------
		function drawInputs(): void {
			if (inputName == "a" && inputType == "primary") {
				inputX = 35;
				inputY = 23;
				//...
				inputA_mux.x = inputX;
				inputA_mux.y = inputY;
				canvas_mux.addChild(inputA_mux);
			} else if (inputName == "b" && inputType == "primary") {
				inputX = 35;
				inputY = 68;
				//...
				inputB_mux.x = inputX;
				inputB_mux.y = inputY;
				canvas_mux.addChild(inputB_mux);
			} else if (inputName == "c" && inputType == "primary") {
				inputX = 35;
				inputY = 113;
				//...
				inputC_mux.x = inputX;
				inputC_mux.y = inputY;
				canvas_mux.addChild(inputC_mux);
			} else if (inputName == "d" && inputType == "primary") {
				inputX = 35;
				inputY = 158;
				//...
				inputD_mux.x = inputX;
				inputD_mux.y = inputY;
				canvas_mux.addChild(inputD_mux);
			} else if (inputName == "s1" && inputType == "selector") {
				inputX = 55;
				inputY = 198;
				//...
				selectorS1_mux.x = inputX;
				selectorS1_mux.y = inputY;
				canvas_mux.addChild(selectorS1_mux);
			} else if (inputName == "s2" && inputType == "selector") {
				inputX = 65;
				inputY = 243;
				//...
				selectorS2_mux.x = inputX;
				selectorS2_mux.y = inputY;
				canvas_mux.addChild(selectorS2_mux);
			}
		} //end function drawInputs
		//...
	}

}