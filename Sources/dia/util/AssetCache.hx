package dia.util;

import kha.Sound;
import kha.Font;

import dia.graphics.Texture;
import dia.graphics.Tileset;

class AssetCache {

	private var textureCache : Map <String, Texture>;
	private var tilesetCache : Map <String, Tileset>;
	private var audioCache : Map <String, Sound>;
	private var fontCache : Map <String, Font>;

	public function new() {
		textureCache = new Map();
		tilesetCache = new Map();
		audioCache = new Map();
		fontCache = new Map();
	}

	public function loadTexture(id : String, texture : Texture) : Texture{
		textureCache.set(id, texture);
		return texture;
	}

	public function getTexture(id : String) : Texture {
		return textureCache.get(id);
	}

	public function loadTileset(id : String, tileset : Tileset) : Tileset{
		tilesetCache.set(id, tileset);
		return tileset;
	}

	public function getTileset(id : String) : Tileset {
		return tilesetCache.get(id);
	}

	public function loadSound(id : String, sound : Sound) : Sound {
		audioCache.set(id, sound);
		return sound;
	}

	public function getSound(id : String) : Sound {
		return audioCache.get(id);
	}

	public function loadFont(id : String, font : Font) : Font {
		fontCache.set(id, font);
		return font;
	}

	public function getFont(id : String) : Font {
		return fontCache.get(id);
	}

}