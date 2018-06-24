package dia;

import kha.math.Vector2;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Mouse;
import kha.input.Gamepad;

import dia.input.InputState;
import dia.input.Controller;

class Input {

	/* keyboard */
	private var keys : Map<KeyCode, InputState>;
	private var keyPressed : KeyCode->Void;
	private var keyReleased : KeyCode->Void;

	/* mouse */
	private var mousePosition : Vector2;
	private var mouseWheelPosition : Float;
	private var mouseButtons : Map<Int, Bool>;

	/* gamepad */
	private var gamepads : Array<Controller>;

	public function new() {
		keys = new Map();
		
		mousePosition = new Vector2();
		mouseButtons = new Map();
		mouseWheelPosition = 0;

		gamepads = [];
		for(i in 0...4) {
			gamepads.push(new Controller(i));
		}
	}

	public function create() {
		Keyboard.get().notify(onKeyDown, onKeyUp);
		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, onMouseWheelMove);

		for(i in 0...4) {
			Gamepad.get(i).notify(gamepads[i].onAxis, gamepads[i].onButton);
		}

		Gamepad.notifyOnConnect(onGamepadConnect, onGamepadDisconnect);
	}

	public function update() {
		
	}

	public function onKeyPressed(callback : KeyCode->Void) {
		keyPressed = callback;
	}

	public function onKeyReleased(callback : KeyCode->Void) {
		keyReleased = callback;
	}

	public function getKey(keyCode : KeyCode) : Bool {
		if(keys.exists(keyCode))
			return keys.get(keyCode).getState();
		return false;
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
	
	public function getMouseWheelMovement() : Float {
		return mouseWheelPosition;
	}

	/**
		KEYBOARD EVENTS
	**/
	
	private function onKeyDown(keyCode : KeyCode) {
		var state = new InputState();
		state.press();

		if(keyPressed != null)
			keyPressed(keyCode);

		keys.set(keyCode, state);
	}

	private function onKeyUp(keyCode : KeyCode) {
		var state = keys.get(keyCode);
		state.release();

		if(keyReleased != null)
			keyReleased(keyCode);

		keys.set(keyCode, state);
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

	private function onMouseWheelMove(x : Float) {
		mouseWheelPosition = x;
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