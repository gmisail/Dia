package dia.graphics;

import kha.graphics2.Graphics;
import kha.math.Vector2;
import kha.math.FastMatrix3;

class Camera {

	public var position : Vector2;
	public var matrix : FastMatrix3;

	public var angle : Float = 0;

	private var shakePeriod : Float;

	public function new() {
		this.position = new Vector2();
		this.matrix = FastMatrix3.identity();

		this.shakePeriod = Math.PI * 2;
	}

	public function startCamera(framebuffer : Graphics) {
		framebuffer.transformation = matrix;
		framebuffer.pushRotation(angle, Dia.core.WINDOW_WIDTH / 2, Dia.core.WINDOW_HEIGHT / 2);
	}

	public function stopCamera(framebuffer : Graphics) {
		framebuffer.popTransformation();
	}

	public function moveBy(x : Float, y : Float) {
		this.position.x += x;
		this.position.y += y;

		this.matrix = FastMatrix3.translation(this.position.x, this.position.y);
	}

	public function moveTo(x : Float, y : Float) {
		this.position.x = x;
		this.position.y = y;

		this.matrix = FastMatrix3.translation(this.position.x, this.position.y);
	}

	public function rotateBy(angle : Float) {
		this.angle += angle;
	}

	public function rotateTo(angle : Float) {
		this.angle = angle;
	}

	public function shake(amplitude : Float) {
		moveTo(amplitude * Math.sin(shakePeriod * Math.random()), amplitude * Math.sin(shakePeriod * Math.random()));
	}

}