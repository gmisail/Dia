package dia;

class App {

	public function new() {
		Dia.create();

		Dia.core.notifyOnLoad(load);
		Dia.core.notifyOnDraw(draw);
		Dia.core.notifyOnUpdate(update);
	
		Dia.core.create();
	}

	public function load() {

	}

	public function update() {

	}

	public function draw() {
		
	}

}