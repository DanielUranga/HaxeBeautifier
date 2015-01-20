package ;

import com.daniel.haxebeautifier.HaxeBeautifier;
import sys.io.File;

class Main {

	public static function main() {
		var testStr = File.getContent('test/AACSound.hx');
		var beautifier = new HaxeBeautifier();
		var r = beautifier.beautify(testStr);
		trace(r);
	}

}
