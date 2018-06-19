package dia;

import kha.math.Vector2;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Mouse;
import kha.input.Gamepad;

import dia.input.Controller;

class Input {

	/* keyboard */
	private var keys : Map<KeyCode, Bool>;
	private var justPressed : Map<KeyCode, Bool>;
	private var justReleased : Map<KeyCode, Bool>;

	/* mouse */
	private var mousePosition : Vector2;
	private var mouseButtons : Map<Int, Bool>;

	/* gamepad */
	private var gamepads : Array<Controller>;

	public function new() {
		keys = new Map();
		justPressed = new Map();
		justReleased = new Map();
		
		mousePosition = new Vector2();
		mouseButtons = new Map();

		gamepads = [];
		for(i in 0...4) {
			gamepads.push(new Controller(i));
		}
	}

	public function create() {
		Keyboard.get().notify(onKeyDown, onKeyUp);
		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, null);

		for(i in 0...4) {
			Gamepad.get(i).notify(gamepads[i].onAxis, gamepads[i].onButton);
		}

		Gamepad.notifyOnConnect(onGamepadConnect, onGamepadDisconnect);
	}

	public function update() {
		
	}

	public function getKey(keyCode : KeyCode) : Bool {
		return keys.get(keyCode);
	}

	public function getKeyJustPressed(keyCode : KeyCode) : Bool {
		return justPressed.get(keyCode);
	}

	public function isGamepadAvailable(id : Int) : Bool {
		return gamepads[id].active;
	}
	
	public function getButton(controller : Int, button : String) : Bool {
		return gamepads[controller].buttons[button];
	}

	public function getAxis(controller : Int, key : String) : Bool {
		return gamepads[controller].buttons[key];
	}

	public function getMouseButton(buttonId : Int) : Bool {
		return mouseButtons.get(buttonId);
	}

	public function getMousePosition() : Vector2 {
		return mousePosition;
	}

	/**
		KEYBOARD EVENTS
	**/
	
	private function onKeyDown(keyCode : KeyCode) {
		keys.set(keyCode, true);
	}

	private function onKeyUp(keyCode : KeyCode) {
		keys.set(keyCode, false);
	}

	/**
		MOUSE EVENTS
	**/

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

	/**
		GAMEPAD (GLOBAL) EVENTS
	**/

	private function onGamepadConnect(id : Int) {
		gamepads[id].active = true;
	}

	private function onGamepadDisconnect(id : Int) {
		gamepads[id].active = false;
	}

}