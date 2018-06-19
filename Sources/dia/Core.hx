package dia;

import kha.Scheduler;
import kha.System;
import kha.Assets;
import kha.Framebuffer;

import dia.util.AssetCache;

class Core {

	public var TARGET_FPS : Int = 60;

	public var assetCache : AssetCache;

	private var drawCallback : Void->Void;
	private var updateCallback : Void->Void;
	private var loadCallback : Void->Void;

	public function new() {
		
	}

	public function create() {
		System.init({title: Dia.window.getTitle(), 
			width: Dia.window.getWindowWidth(), 
			height: Dia.window.getWindowHeight(), 
			vSync: Dia.window.getVsync(), 
			samplesPerPixel: Dia.window.getSamplesPerPixel(),
			resizable: Dia.window.getResizable(),
			maximizable: Dia.window.getMaximizable(),
			minimizable: Dia.window.getMinimizable()
		}, function(){
			Assets.loadEverything(function(){
				assetCache = new AssetCache();

				Dia.gfx.create();
				Dia.input.create();
				
				if(loadCallback != null) loadCallback();

				Scheduler.addTimeTask(update, 0, 1 / Dia.window.getTargetFPS());	
				System.notifyOnRender(draw);
			});
		});
	}

	public function notifyOnDraw(callback : Void->Void) {
		this.drawCallback = callback;
	}

	public function notifyOnLoad(callback : Void->Void) {
		this.loadCallback = callback;
	}

	public function notifyOnUpdate(callback : Void->Void) {
		this.updateCallback = callback;
	}

	public function update() {
//		Dia.input.update();
		if(updateCallback != null) updateCallback();
	}

	public function draw(framebuffer : Framebuffer) {
		Dia.gfx.startBuffer(framebuffer);
		if(drawCallback != null) drawCallback();
		Dia.gfx.endBuffer(framebuffer);
	}

}