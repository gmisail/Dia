package dia.audio;

import kha.math.Vector2;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;
import kha.Sound in KSound;

class Sound {

	private var min : Float = 0;
	private var max : Float = 1;

	private var position : Vector2;

	private var audioChannel : AudioChannel;
	private var sound : KSound;

	private var volume : Float = 1;

	public function new(sound : KSound) {
		this.sound = sound;
		this.position = new Vector2();
	}

	public function setVolume(volume : Float) {
		if(volume < min) {
			volume = min;
		} else if(volume > max) {
			volume = max;
		}

		if(audioChannel != null) {
			audioChannel.volume = volume;
		}
	}

	public function getVolume() : Float {
		return volume;
	}

	public function setPosition(x : Float, y : Float) {
		this.position.x = x;
		this.position.y = y;
	}

	public function getPosition() : Vector2 {
		return this.position;
	}

	public function play(loop : Bool) {
		audioChannel = Audio.play(sound, loop);
		audioChannel.volume = volume;
	}

	public function stop() {
		audioChannel.stop();
	}
}