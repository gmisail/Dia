package dia.util;

class Random {

	public function new() {

	}

	public function getRange(min : Int, max : Int) : Int {
		return Std.int(Math.random() * ((max - min) + 1) + min);
	}

	public function getValue(max : Int) : Int {
		return Std.int(Math.random() * max);
	}

}