# Dia
Lightweight game framework for Haxe

## What is Dia?

Dia is a lightweight game framework written in Haxe. The API of Dia is heavily inspired by LÖVE and Haxegon.

## Example

#### Main.hx
```
package;

import kha.Assets;

import dia.App;
import dia.Dia;

class Main extends App{
	
	public static function main() {
		new Main();
	}

	public override function load() {
		Dia.gfx.setBackbuffer(true);

		Dia.music.loadAudio("song", Assets.sounds.NM_Song);
		Dia.music.loadAudio("jump", Assets.sounds.Jump);

		Dia.gfx.createTexture("face", Assets.images.face);
		Dia.gfx.createTexture("enemy", Assets.images.enemy);
		Dia.gfx.createTexture("mario", Assets.images.mario);
		Dia.gfx.createTileset("marioTileset", "mario", 16);

		Dia.gfx.createFont("commodore", Assets.fonts.c64);

		Dia.music.play(Dia.music.getAudio("song"), false);
	}

	public override function update() {
		
	}

	public override function draw() {
		for(x in 0...16) {
			for(y in 0...16) {
				Dia.gfx.drawTile(Dia.gfx.getTileset("marioTileset"), x * y, x * 16, y * 16, 1, 1);
			}
		}

		Dia.gfx.drawTexture(Dia.gfx.getTexture("face"), 300, 300, 4, 4);
		Dia.gfx.drawTexture(Dia.gfx.getTexture("face"), 400, 128, 2, 2, Math.PI / 4);
		Dia.gfx.drawText("Hello!", Dia.gfx.getFont("commodore"), 36, 200, 200);
	}

}
```

#### Result

![alt text](https://github.com/gmisail/Dia/raw/master/example.png "Glorious example")

## Features

- [X] Support for textures, tilesets, text, primitives (rectangles)
- [X] Asset cache
- [X] Audio
- [X] Keyboard input
- [X] Mouse input
- [X] Gamepad input
- [X] Camera
- [X] Texture & Text preloader
- [X] Improved audio settings (volume, position)
- [X] Game saves (native & WebStorage)
- [X] Improved input events (justPressed, justReleased)

## Planned

- [ ] Shaders

