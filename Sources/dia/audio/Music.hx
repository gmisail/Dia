package dia.audio;

import kha.Sound;
import kha.audio1.Audio;

class Music {

	public function new() {

	}

	public function loadAudio(id : String, sound : Sound) : Sound {
		return Dia.core.assetCache.loadSound(id, sound);
	}

	public function getAudio(id : String) : Sound {
		return Dia.core.assetCache.getSound(id);
	}

	public function play(sound : Sound, repeat : Bool) {
		Audio.play(sound, repeat);
	}

}