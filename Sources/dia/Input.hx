package dia;

import kha.math.Vector2;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Mouse;

class Input {

	/* keyboard */
	private var keys : Map<KeyCode, Bool>;
	private var justPressed : Map<KeyCode, Bool>;
	private var justReleased : Map<KeyCode, Bool>;

	/* mouse */
	private var mousePosition : Vector2;
	private var mouseButtons : Map<Int, Bool>;

	public function new() {
		keys = new Map();
		justPressed = new Map();
		justReleased = new Map();
		
		mousePosition = new Vector2();
		mouseButtons = new Map();
	}

	public function create() {
		Keyboard.get().notify(onKeyDown, onKeyUp);
		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, null);
	}

	public function update() {
		
	}

	public function getKey(keyCode : KeyCode) : Bool {
		return keys.get(keyCode);
	}

	public function getKeyJustPressed(keyCode : KeyCode) : Bool {
		return justPressed.get(keyCode);
	}

	public function getButton() {

	}

	public function getAxis() {

	}

	public function getMouseButton(buttonId : Int) : Bool {
		return mouseButtons.get(buttonId);
	}

	public function getMousePosition() : Vector2 {
		return mousePosition;
	}
	
	private function onKeyDown(keyCode : KeyCode) {
		keys.set(keyCode, true);
	}

	private function onKeyUp(keyCode : KeyCode) {
		keys.set(keyCode, false);
	}

	private function onMouseDown(button : Int, x : Int, y : Int) {
		mouseButtons.set(button, true);
	}

	private function onMouseUp(button : Int, x : Int, y : Int) {
		mouseButtons.set(button, false);
	}

	private function onMouseMove(x : Int, y : Int, cx : Int, cy : Int) {
		mousePosition.x = x;
		mousePosition.y = y;
	}

	private function onMouseWheelMove() {

	}
}