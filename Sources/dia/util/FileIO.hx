package dia.util;

import haxe.Json;

import kha.Blob;
import kha.Assets;

class FileIO {

	private var fileCache : Map<String, Blob>;

	public function new() {
		fileCache = new Map();
	}

	public function loadFile(name : String, path : String) {
		fileCache.set(name, Assets.blobs.get(path));
	}

	public function preloadFiles(files : Map <String, String>) {
		for(name in files.keys()) {
			loadFile(name, files[name]);
		}
	}

	public function getText(name : String) : String {
		return fileCache.get(name).readUtf8String();
	}

	public function getJSON(name : String) : Dynamic {
		return Json.parse(getText(name));
	}

	public function getXML(name : String) : Xml {
		return Xml.parse(getText(name));
	}

}