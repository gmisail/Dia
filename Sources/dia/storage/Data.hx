package dia.storage;

import haxe.Json;
import kha.Storage;
import kha.StorageFile;

class Data {

	private var SAVED : Bool = false;

	private var data : Dynamic;

	public function new() {
		
	}

	public function create() {
		data = getSave().readObject();
	}

	public function set(id : String, val : Dynamic) {
		Reflect.setField(data, id, val);
	}

	public function get(id : String) : Dynamic {
		return Reflect.field(data, id);
	}

	public function save() {
		getSave().writeObject(data);
		SAVED = true;
	}

	public function erase() {
		data = {};
		getSave().writeObject(data);
	}

	public function isSaved() : Bool {
		return SAVED;
	}

	public function getSave() : StorageFile {
		return Storage.namedFile("gamesave.kha");
	}

}