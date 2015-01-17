package ;

import haxe.macro.Expr;
import sys.io.File;
import haxeparser.HaxeParser;
import haxeparser.Data;

class Main 
{

	public static function main()
	{
		var testStr = File.getContent('test/AACSound.hx');
		var parser = new HaxeParser(byte.ByteData.ofString(testStr), '');
		var p : PParserResult = parser.parse();
		trace(p.print());
	}

}
