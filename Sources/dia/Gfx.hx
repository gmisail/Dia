package dia;

import kha.Color;
import kha.Framebuffer;
import kha.Image;
import kha.Font;
import kha.Scaler;
import kha.System;
import kha.graphics2.Graphics;
import kha.graphics4.VertexShader;
import kha.graphics4.FragmentShader;

import dia.graphics.Drawable;
import dia.graphics.Texture;
import dia.graphics.Camera;
import dia.graphics.Tileset;
import dia.graphics.Shader;
import dia.util.AssetCache;

class Gfx {

	private var BACKBUFFER_ENABLED : Bool = false;
	
	private var backbuffer : Image;
	private var framebuffer : Graphics;

	public var camera : Camera;

	public function new() {
		camera = new Camera();
	}

	public function create() {
		backbuffer = Image.createRenderTarget(Dia.core.WINDOW_WIDTH, Dia.core.WINDOW_HEIGHT);
	}

	public function startBuffer(buffer : Framebuffer) {
		if(BACKBUFFER_ENABLED) {
			framebuffer = backbuffer.g2;
		} else {
			framebuffer = buffer.g2;
		}

		framebuffer.begin();
		camera.startCamera(framebuffer);
	}

	public function endBuffer(buffer : Framebuffer) {
		camera.stopCamera(framebuffer);
		framebuffer.end();

		if(BACKBUFFER_ENABLED) {
			buffer.g2.begin();
			Scaler.scale(backbuffer, buffer, System.screenRotation);
			buffer.g2.end();
		}
	}

	public function setColor(color : Color) {
		framebuffer.color = color;
	}

	public function setBackbuffer(state : Bool) {
		BACKBUFFER_ENABLED = state;
	}

	public function createTexture(id : String, image : Image) {
		Dia.core.assetCache.loadTexture(id, new Texture(image));
	}

	public function preloadTextures(textures : Map <String, Image>) {
		for(name in textures.keys()) {
			createTexture(name, textures[name]);
		}
	}

	public function getTexture(id : String) : Texture {
		return Dia.core.assetCache.getTexture(id);
	}

	public function createTileset(name : String, texture : Texture, tileSize : Int) {
		var tiles = new Tileset(texture, tileSize);
		tiles.generateTileset();
		return Dia.core.assetCache.loadTileset(name, tiles);
	}

	public function getTileset(id : String) : Tileset {
		return Dia.core.assetCache.getTileset(id);
	}

	public function createFont(id : String, font : Font) : Font {
		return Dia.core.assetCache.loadFont(id, font);
	}

	public function getFont(id : String) : Font {
		return Dia.core.assetCache.getFont(id);
	}

	public function createShader(vert : VertexShader, frag : FragmentShader) : Shader {
		return new Shader(vert, frag);
	}

	public function pushShader(shader : Shader) {
		framebuffer.pipeline = shader.pipelineState;
	}

	public function popShader() {
		framebuffer.pipeline = null;
	}

	public function rectangle(x : Float, y : Float, w : Int, h : Int, ?angle : Float = 0) {
		framebuffer.pushRotation(angle, w / 2 + x, h / 2 + y);
		framebuffer.fillRect(x, y, w, h);
		framebuffer.popTransformation();
	}

	public function drawTexture(texture : Texture, ?x : Float = 0, ?y : Float = 0, ?sx : Float = 1, ?sy : Float = 1, ?angle : Float = 0) {
		drawSubTexture(texture, 0, 0, texture.image.width, texture.image.height, x, y, sx, sy, angle);
	}

	public function drawSubTexture(texture : Texture, originX : Float, originY : Float, w : Int, h : Int, ?x : Float = 0, ?y : Float = 0, ?sx : Float = 1, ?sy : Float = 1, ?angle : Float = 0) {
		framebuffer.pushRotation(angle, w / 2 + x, h / 2 + y);
		framebuffer.drawScaledSubImage(texture.image, originX, originY, w, h, x, y, w * sx, h * sy);
		framebuffer.popTransformation();
	}

	public function drawTile(tileset : Tileset, id : Int, ?x : Float = 0, ?y : Float = 0, ?sx : Int = 1, ?sy : Int = 1, ?angle : Float = 0) {
		var tileRect = tileset.getTileById(id);
		drawSubTexture(tileset.texture, tileRect.x, tileRect.y, tileRect.w, tileRect.h, x, y, sx, sy, angle);
	}

	public function drawText(text : String, font : Font, ?size : Int = 16, ?x : Float = 0, ?y : Float = 0, ?angle : Float = 0) {
		framebuffer.pushRotation(angle, font.width(size, text) / 2 + x, size / 2 + y);
		framebuffer.font = font;
		framebuffer.fontSize = size;
		framebuffer.drawString(text, x, y);
		framebuffer.popTransformation();
	}

	public function draw(drawable : Drawable) {
		drawable.draw(framebuffer);
	}
}