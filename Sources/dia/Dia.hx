package dia;

import dia.audio.Music;
import dia.util.FileIO;
import dia.util.Random;
import dia.storage.Data;

class Dia {
	
	public static var window : Window;
	public static var core : Core;
	public static var gfx : Gfx;
	public static var input : Input;
	public static var music : Music;
	public static var files : FileIO;
	public static var random : Random;
	public static var data : Data;
	public static var timer : Timer;

	public static function create() {
		window = new Window();
		core = new Core();
		gfx = new Gfx();
		input = new Input();
		music = new Music();
		files = new FileIO();
		random = new Random();
		data = new Data();
		timer = new Timer();
	}

}