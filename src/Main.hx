
package ;

import haxeparser.HaxeParser;
import sys.io.File;

class Main 
{

	public static function main()
	{
		var testStr = File.getContent('test/AACSound.hx');
		//trace(testStr);
		var parser = new HaxeParser(byte.ByteData.ofString(testStr), '');
		trace(parser.parse().decls);
	}

}