package dia;

import dia.audio.Music;

class Dia {
	
	public static var window : Window;
	public static var core : Core;
	public static var gfx : Gfx;
	public static var input : Input;
	public static var music : Music;

	public static function create() {
		window = new Window();
		core = new Core();
		gfx = new Gfx();
		input = new Input();
		music = new Music();
	}

}