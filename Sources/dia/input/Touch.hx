package dia.input;

import kha.math.Vector2;

class Touch {

	private var state : Bool = false;
	private var position : Vector2;
	private var id : Int;

	public function new() {
		position = new Vector2(-1, -1);
	}

	public function setPosition(x : Float, y : Float) {
		position.x = x;
		position.y = y;
	}

	public function setId(id : Int) {
		this.id = id;
	}

	public function getId() : Int {
		return id;
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

}