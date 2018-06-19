package dia;

class Window {

	private var TITLE : String = "Dia";
	
	private var WINDOW_WIDTH : Int = 800;
	private var WINDOW_HEIGHT : Int = 600;

	private var RENDERER_WIDTH : Int = 800;
	private var RENDERER_HEIGHT : Int = 600;

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

}