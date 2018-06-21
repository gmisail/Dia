package dia;

import kha.Scheduler;

class Timer {

	private var deltaTime : Float = 0;
	private var lastTime : Float = 0;

	public function new() {
	
	}

	public function getDelta() : Float {
		return deltaTime;
	}

	public function update() {
		var currentTime = Scheduler.time();
    	deltaTime = currentTime - lastTime;
    	lastTime = currentTime;
	}

	public function reset() {
    	lastTime = Scheduler.time();
    	deltaTime = 0;
  	}

}