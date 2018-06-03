package;

import kha.Assets;
import kha.input.KeyCode;

import dia.App;
import dia.Dia;
import dia.math.Rectangle;

class Pong extends App{
	
	var oneBounds : Rectangle; 
	var twoBounds : Rectangle;

	var ballBounds : Rectangle;

	var ballVelX : Int = 3;
	var ballVelY : Int = 3;

	public static function main() {
		new Main();
	}

	public override function load() {
		Dia.gfx.setBackbuffer(true);

		oneBounds = new Rectangle(16, 64, 16, 64);
		twoBounds = new Rectangle(768, 64, 16, 64);

		ballBounds = new Rectangle(48, 48, 32, 32);
	}

	public override function update() {
		if (oneBounds.x < ballBounds.x + ballBounds.w &&
   			oneBounds.x + oneBounds.w > ballBounds.x &&
   			oneBounds.y < ballBounds.y + ballBounds.h &&
   			oneBounds.h + oneBounds.y > ballBounds.y) {
			ballVelX *= -1;
			ballVelY *= -1;
		}

		if (twoBounds.x < ballBounds.x + ballBounds.w &&
   			twoBounds.x + twoBounds.w > ballBounds.x &&
   			twoBounds.y < ballBounds.y + ballBounds.h &&
   			twoBounds.h + twoBounds.y > ballBounds.y) {
			ballVelX *= -1;
			ballVelY *= -1;
		}

		if(ballBounds.x < 0 || ballBounds.x + ballBounds.w > 800)
			ballVelX *= -1;

		if(ballBounds.y < 0 || ballBounds.y + ballBounds.h > 600)
			ballVelY *= -1;
			
		ballBounds.x += ballVelX;
		ballBounds.y += ballVelY;

		if(Dia.input.getKey(KeyCode.W)) {
			oneBounds.y -= 4;
		}

		if(Dia.input.getKey(KeyCode.S)) {
			oneBounds.y += 4;
		}

		if(Dia.input.getKey(KeyCode.I)) {
			twoBounds.y -= 4;
		}

		if(Dia.input.getKey(KeyCode.K)) {
			twoBounds.y += 4;
		}
	}

	public override function draw() {
		Dia.gfx.rectangle(oneBounds.x, oneBounds.y, oneBounds.w, oneBounds.h);
		Dia.gfx.rectangle(twoBounds.x, twoBounds.y, twoBounds.w, twoBounds.h);
		Dia.gfx.rectangle(ballBounds.x, ballBounds.y, ballBounds.w, ballBounds.h);
	}

}
