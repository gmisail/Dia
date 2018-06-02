package dia.graphics;

import dia.math.Rectangle;

class Tileset {

	public var tileSize : Int;
	public var texture : Texture;

	public var tiles : Array<Rectangle>;

	public var width : Int;
	public var height : Int;

	public function new(texture : Texture, tileSize : Int = 16) {
		this.texture = texture;
		this.tileSize = tileSize;
		this.width = this.texture.image.width;
		this.height = this.texture.image.height;
		this.tiles = [];
	}

	public function generateTileset() {
		var xIter = Std.int(width / tileSize);
		var yIter = Std.int(height / tileSize);

		for(x in 0...xIter) {
			for(y in 0...yIter) {
				var tile = new Rectangle(x * tileSize, y * tileSize, tileSize, tileSize);
				tiles.push(tile);
			}
		}	
	}

	public function getTileById(id : Int) {
		return tiles[id];
	}

}