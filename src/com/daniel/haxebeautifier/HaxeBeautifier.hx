
package com.daniel.haxebeautifier;

import byte.ByteData;
import sys.io.File;
import haxeparser.HaxeParser;

class HaxeBeautifier 
{

	public function new() {

	}

	public function beautify(haxeCode : String) : String {
		var parser = new HaxeParser(ByteData.ofString(haxeCode), '');
		var parserResult : PParserResult = parser.parse();
		return parserResult.print(new Printer());
	}

	public function beautifyFile(inputFilePath : String, outputFilePath : String) {
		var beautifiedCode = beautify(File.getContent(inputFilePath));
		File.saveContent(outputFilePath, beautifiedCode);
	}

}