package dia.audio;

import kha.Sound in KSound;
import kha.audio1.Audio;

class Music {

	public function new() {

	}

	public function loadAudio(id : String, sound : KSound) : Sound {
		return Dia.core.assetCache.loadSound(id, sound);
	}

	public function getAudio(id : String) : Sound {
		return Dia.core.assetCache.getSound(id);
	}

	public function play(sound : KSound, repeat : Bool) {
		Audio.play(sound, repeat);
	}

}