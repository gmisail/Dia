package dia.input;

class InputState {

	public var state : Bool = false;
	public var justPressed : Bool = false;
	public var justReleased : Bool = false;

	public function new() {

	}

	public function press() {
		state = true;
	}

	public function release() {
		state = false;
	}
}