package dia;

import kha.WindowMode;

class Window {

	private var TITLE : String = "Dia";
	
	private var WINDOW_WIDTH : Int = 800;
	private var WINDOW_HEIGHT : Int = 600;

	private var RENDERER_WIDTH : Int = 800;
	private var RENDERER_HEIGHT : Int = 600;

	private var VSYNC : Bool = true;
	private var SAMPLES_PER_PIXEL : Int = 1;
	private var TARGET_FPS : Int = 60;
	private var WINDOW_MODE : WindowMode;
	private var RESIZABLE : Bool = true;
	private var MAXIMIZABLE : Bool = true;
	private var MINIMIZABLE : Bool = true;

	public function new() {
		
	}

	public function getTitle() : String {
		return TITLE;
	}

	public function setTitle(title : String) {
		this.TITLE = title;
	}

	public function getWindowWidth() : Int {
		return WINDOW_WIDTH;
	}

	public function getWindowHeight() : Int {
		return WINDOW_HEIGHT;
	}

	public function getRendererWidth() : Int {
		return RENDERER_WIDTH;
	}

	public function getRendererHeight() : Int {
		return RENDERER_HEIGHT;
	}

	public function setSize(w : Int, h : Int, ?scale : Int = 1) {
		this.WINDOW_WIDTH = w;
		this.WINDOW_HEIGHT = h;
		this.RENDERER_WIDTH = Std.int(w / scale);
		this.RENDERER_HEIGHT = Std.int(h / scale);
	}

	public function setVsync(state : Bool) {
		this.VSYNC = state;
	}

	public function getVsync() : Bool {
		return this.VSYNC;
	}

	public function setResizable(state : Bool) {
		this.RESIZABLE = state;
	}

	public function getResizable() : Bool {
		return this.RESIZABLE;
	}

	public function setMaximizable(state : Bool) {
		this.MAXIMIZABLE = state;
	}

	public function getMaximizable() : Bool {
		return this.MAXIMIZABLE;
	}

	public function setMinimizable(state : Bool) {
		this.MINIMIZABLE = state;
	}

	public function getMinimizable() : Bool {
		return this.MINIMIZABLE;
	}

	public function setTargetFPS(fps : Int) {
		this.TARGET_FPS = fps;
	}

	public function getTargetFPS() : Int {
		return this.TARGET_FPS;
	}

	public function setSamplesPerPixel(val : Int) {
		this.SAMPLES_PER_PIXEL = val;
	}

	public function getSamplesPerPixel() : Int {
		return this.SAMPLES_PER_PIXEL;
	}

}