package dia.input;

class Controller {

	public var id : Int = -1;
	public var buttons : Map<String, Bool>;

	public function new(id : Int) {
		this.id = id;
		this.buttons = new Map();
	}

	public function onAxis(axis : Int, value : Float) {
		if (axis == 0){
			if (value < -0.5){
				buttons.set(ControllerKeys.LEFT_ANALOG_LEFT, true);
			} else if (value > 0.5){
				buttons.set(ControllerKeys.LEFT_ANALOG_RIGHT, true);
			} else {
				buttons.set(ControllerKeys.LEFT_ANALOG_LEFT, false);
				buttons.set(ControllerKeys.LEFT_ANALOG_RIGHT, false);
			}
		}
		if (axis == 1){
			if (value > 0.5){
				buttons.set(ControllerKeys.LEFT_ANALOG_UP, true);
			} else if (value < -0.5){
				buttons.set(ControllerKeys.LEFT_ANALOG_DOWN, true);
			} else {
				buttons.set(ControllerKeys.LEFT_ANALOG_UP, false);
				buttons.set(ControllerKeys.LEFT_ANALOG_DOWN, false);
			}
		}
		
		if (axis == 3){
			if (value < -0.5){
				buttons.set(ControllerKeys.RIGHT_ANALOG_LEFT, true);
			} else if (value > 0.5){
				buttons.set(ControllerKeys.RIGHT_ANALOG_RIGHT, true);
			} else {
				buttons.set(ControllerKeys.RIGHT_ANALOG_LEFT, false);
				buttons.set(ControllerKeys.RIGHT_ANALOG_RIGHT, false);
			}
		}

		if (axis == 4){
			if (value > 0.5){
				buttons.set(ControllerKeys.RIGHT_ANALOG_UP, true);
			} else if (value < -0.5){
				buttons.set(ControllerKeys.RIGHT_ANALOG_DOWN, true);
			} else {
				buttons.set(ControllerKeys.RIGHT_ANALOG_UP, false);
				buttons.set(ControllerKeys.RIGHT_ANALOG_DOWN, false);
			}
		}
		
		if (axis == 2){
			if (value < -0.5){
				buttons.set(ControllerKeys.LEFT_TRIGGER, true);
			} else {
				buttons.set(ControllerKeys.LEFT_TRIGGER, false);
			}
		}
		
		if (axis == 5){
			if (value < -0.5){
				buttons.set(ControllerKeys.RIGHT_TRIGGER, true);
			} else {
				buttons.set(ControllerKeys.RIGHT_TRIGGER, false);
			}
		}
	}

	public function onButton(button : Int, value : Float) {
		if (button == 0){
			buttons.set(ControllerKeys.A, getState(value));
		}
		
		if (button == 1){
			buttons.set(ControllerKeys.B, getState(value));
		}
		
		if (button == 2){
			buttons.set(ControllerKeys.X, getState(value));
		}
		
		if (button == 3){
			buttons.set(ControllerKeys.Y, getState(value));
		} 

		if (button == 4){
			buttons.set(ControllerKeys.LEFT_BUMPER, getState(value));
		}
		
		if (button == 5){
			buttons.set(ControllerKeys.RIGHT_BUMPER, getState(value));
		}
		
		if (button == 6){
			buttons.set(ControllerKeys.LEFT_ANALOG_PRESS, getState(value));
		}
		
		if (button == 7){
			buttons.set(ControllerKeys.RIGHT_ANALOG_PRESS, getState(value));
		} 
		
		if (button == 8){
			buttons.set(ControllerKeys.START, getState(value));
		} 
		
		if (button == 9){
			buttons.set(ControllerKeys.BACK, getState(value));
		} 
		
		if (button == 10){
			buttons.set(ControllerKeys.HOME, getState(value));
		} 
		
		if (button == 11){
			buttons.set(ControllerKeys.DPAD_UP, getState(value));
		}
		
		if (button == 12){
			buttons.set(ControllerKeys.DPAD_DOWN, getState(value));
		}
		
		if (button == 13){
			buttons.set(ControllerKeys.DPAD_LEFT, getState(value));
		}
		
		if (button == 14){
			buttons.set(ControllerKeys.DPAD_RIGHT, getState(value));
		} 

		trace("button : " + button + " : " + value);
	}

	private function getState(val : Float) : Bool {
		if(val == 0) {
			return false;
		} else {
			return true;
		}
	}

}