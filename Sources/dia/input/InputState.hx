package dia.input;

class InputState {

	private var state : Bool = false;

	public function new() {

	}

	public function getState() : Bool {
		return state;
	}

	public function press() {
		state = true;
	}

	public function release() {
		state = false;
	}

	public function onKeyPress() {
		
	}
}