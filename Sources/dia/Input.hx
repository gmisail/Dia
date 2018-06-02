package dia;

import kha.input.KeyCode;
import kha.input.Keyboard;

class Input {

	private var keys : Map<KeyCode, Bool>;
	private var justPressed : Map<KeyCode, Bool>;
	private var justReleased : Map<KeyCode, Bool>;

	public function new() {
		keys = new Map();
		justPressed = new Map();
		justReleased = new Map();
	}

	public function create() {
		Keyboard.get().notify(onKeyDown, onKeyUp);
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
	
	private function onKeyDown(keyCode : KeyCode) {
		keys.set(keyCode, true);
	}

	private function onKeyUp(keyCode : KeyCode) {
		keys.set(keyCode, false);
	}
}